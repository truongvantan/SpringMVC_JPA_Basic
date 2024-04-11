package com.tvt.service;

import java.util.List;
import java.util.Optional;

import javax.persistence.EntityNotFoundException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tvt.common.PageEnum;
import com.tvt.common.ValidateCommon;
import com.tvt.entity.Category;
import com.tvt.entity.Product;
import com.tvt.repository.CategoryRepository;
import com.tvt.repository.ProductRepository;

@Service("productService")
@Transactional
public class ProductService {

	@Autowired
	private ProductRepository productRepository;

	@Autowired
	private CategoryRepository categoryRepository;

	public int getTotalPages() {
		int totalPageNumber = 1;
		totalPageNumber = (int) productRepository.count();

		return (int) Math.ceil((double) totalPageNumber / PageEnum.NUM_OF_ELEMENT.value);
	}

	public int getTotalPages(String idCategory) {
		int totalPageNumber = 1;
		int categoryId = 0;
		if (ValidateCommon.isValidStringIntegerNumber(idCategory)) {
			categoryId = Integer.valueOf(idCategory);
		}
		totalPageNumber = (int) productRepository.countByCategoryId(categoryId);

		return (int) Math.ceil((double) totalPageNumber / PageEnum.NUM_OF_ELEMENT.value);
	}

	public List<Product> findProductsWithPagination(int pageNumber) {
		Pageable pageable = PageRequest.of(pageNumber - 1, PageEnum.NUM_OF_ELEMENT.value);
		Page<Product> listProducts = productRepository.findAll(pageable);
		return listProducts.getContent();
	}

	public List<Product> findProductsByCategoryIdWithPagination(String idCategory, int pageNumber) {
		int categoryId = 0;

		if (ValidateCommon.isValidStringIntegerNumber(idCategory)) {
			categoryId = Integer.valueOf(idCategory);
		}
		Pageable pageable = PageRequest.of(pageNumber - 1, PageEnum.NUM_OF_ELEMENT.value);
		Page<Product> listProducts = productRepository.findProductsByCategoryIdWithPagination(categoryId, pageable);

		return listProducts.getContent();
	}

	public int countBySearch(String searchText) {
		int totalPageNumber = 1;
		int productId = ValidateCommon.isValidStringIntegerNumber(searchText) ? Integer.valueOf(searchText) : -1;
		double priceIn = ValidateCommon.isValidStringNumber(searchText) ? Double.valueOf(searchText) : -1;
		double priceSell = ValidateCommon.isValidStringNumber(searchText) ? Double.valueOf(searchText) : -1;

		totalPageNumber = (int) productRepository.countBySearch(productId, searchText, searchText, priceIn, priceSell,
				searchText);

		return (int) Math.ceil((double) totalPageNumber / PageEnum.NUM_OF_ELEMENT.value);
	}

	public List<Product> findBySearch(String searchText, int pageNumber) {
		Pageable pageable = PageRequest.of(pageNumber - 1, PageEnum.NUM_OF_ELEMENT.value);
		int productId = ValidateCommon.isValidStringIntegerNumber(searchText) ? Integer.valueOf(searchText) : -1;
		double priceIn = ValidateCommon.isValidStringNumber(searchText) ? Double.valueOf(searchText) : -1;
		double priceSell = ValidateCommon.isValidStringNumber(searchText) ? Double.valueOf(searchText) : -1;

		Page<Product> listProducts = productRepository.search(productId, searchText, searchText, priceIn, priceSell,
				searchText, pageable);

		return listProducts.getContent();
	}

	public String delete(String idProduct) {
		if (idProduct == null || !ValidateCommon.isValidStringIntegerNumber(idProduct)) {
			return "Invalid idProduct";
		} else {
			Optional<Product> p = productRepository.findById(Integer.valueOf(idProduct));
			if (!p.isPresent()) {
				return "Product does not exist";
			} else {
				productRepository.deleteById(Integer.valueOf(idProduct));
			}

		}
		return "No error";
	}

	public String save(String productName, String categoryId, String priceIn, String priceSell, String linkImage,
			String description) {
		String validateMessage = ValidateCommon.validateFieldsProduct(productName, categoryId, priceIn, priceSell);
		if (!"No error".equals(validateMessage)) {
			return validateMessage;
		} else {
			Optional<Category> category = categoryRepository.findById(Integer.valueOf(categoryId));
			if (!category.isPresent()) {
				return "Conflict foreign key";
			} else {
				Category c = category.get();
				Product p = new Product();

				p.setProductName(productName);
				p.setPriceIn(Double.valueOf(priceIn));
				p.setPriceSell(Double.valueOf(priceSell));
				p.setLinkImage(linkImage);
				p.setDescription(description);
				p.setCategory(c);

				productRepository.save(p);

			}
		}

		return "No error";
	}

	public Product findById(String idProduct) {
		if (idProduct == null || !ValidateCommon.isValidStringIntegerNumber(idProduct)) {
			return null;
		} else {
			Optional<Product> p = productRepository.findById(Integer.valueOf(idProduct));
			if (!p.isPresent()) {
				return null;
			} else {
				return p.get();
			}
		}
	}

	public String update(String idProduct, String productName, String categoryId, String priceIn, String priceSell,
			String linkImage, String description) {

		String validateMessage = ValidateCommon.validateFieldsProduct(productName, categoryId, priceIn, priceSell);
		if (!"No error".equals(validateMessage)) {
			return validateMessage;
		} else {
			Optional<Product> product = productRepository.findById(Integer.valueOf(idProduct));
			if (!product.isPresent()) {
				return "Product does not exist";
			} else {
				Product p = product.get();

				Optional<Category> category = categoryRepository.findById(Integer.valueOf(categoryId));
				if (!category.isPresent()) {
					return "Conflict foreign key";
				} else {
					Category c = category.get();
					p.setProductName(productName);
					p.setPriceIn(Double.valueOf(priceIn));
					p.setPriceSell(Double.valueOf(priceSell));
					p.setLinkImage(linkImage);
					p.setDescription(description);
					p.setCategory(c);

					productRepository.save(p);
				}
				return "No error";
			}
		}
	}

}
