package com.tvt.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tvt.common.ValidateCommon;
import com.tvt.entity.Category;
import com.tvt.entity.Product;
import com.tvt.service.CategoryService;
import com.tvt.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private ProductService productService;

	@RequestMapping("/show")
	public String show(Model model, HttpSession session,
			@RequestParam(value = "idCategory", required = false) String idCategory,
			@RequestParam(value = "page", required = false, defaultValue = "1") String page) {
		session.removeAttribute("searchText");
		if (session.getAttribute("sessionAccount") == null) {
			return "redirect:/login?error=1";
		} else {
			// lấy danh sách category
			List<Category> listCategories = categoryService.findAll();

			int pageNumber = 1; // Mặc định là trang 1
			int totalPageNumber = 1;

			if (page != null && !"".equals(page) && ValidateCommon.isValidStringIntegerNumber(page)) {
				pageNumber = Integer.valueOf(page);
			}

			List<Product> listProducts = null;
			if ("".equals(idCategory) || idCategory == null) {
				// lấy tổng số trang
				totalPageNumber = productService.getTotalPages();
				if (pageNumber > totalPageNumber && totalPageNumber > 0) {
					pageNumber = totalPageNumber;
				}
				// lấy danh sách Product
				listProducts = productService.findProductsWithPagination(pageNumber);
			} else {
				// lấy tổng số trang theo category_id
				totalPageNumber = productService.getTotalPages(idCategory);
				if (pageNumber > totalPageNumber && totalPageNumber > 0) {
					pageNumber = totalPageNumber;
				}
				// lấy danh sách Product theo category_id
				listProducts = productService.findProductsByCategoryIdWithPagination(idCategory, pageNumber);
			}

			model.addAttribute("listCategories", listCategories);
			model.addAttribute("listProducts", listProducts);
			model.addAttribute("currentPageNumer", pageNumber);
			model.addAttribute("totalPageNumber", totalPageNumber);

			return "productList";
		}
	}

	@RequestMapping("/search")
	public String searchProduct(HttpSession session, Model model,
			@RequestParam(value = "searchText", required = false) String searchText,
			@RequestParam(value = "page", required = false) String page) {
		if (session.getAttribute("sessionAccount") == null) {
			return "redirect:/login?error=1";
		} else {
			if (searchText == null) {
				searchText = (String) session.getAttribute("searchText");
			}

			// phân trang
			int pageNumber = 1; // Mặc định là trang 1
			if (page != null && !"".equals(page) && ValidateCommon.isValidStringIntegerNumber(page)) {
				pageNumber = Integer.valueOf(page);
			}

			List<Category> listCategories = categoryService.findAll();
			int totalPageNumber = productService.countBySearch(searchText);

			if (pageNumber > totalPageNumber && totalPageNumber > 0) {
				pageNumber = totalPageNumber;
			}
			List<Product> listProducts = productService.findBySearch(searchText, pageNumber);

			model.addAttribute("listCategories", listCategories);
			model.addAttribute("listProducts", listProducts);
			model.addAttribute("currentPageNumer", pageNumber);
			model.addAttribute("totalPageNumber", totalPageNumber);
			session.setAttribute("searchText", searchText);

			return "productList";
		}
	}

	@RequestMapping("/delete")
	public String deleteProduct(Model model, HttpSession session,
			@RequestParam(value = "idProduct", required = false) String idProduct) {
		if (session.getAttribute("sessionAccount") == null) {
			return "redirect:/login?error=1";
		} else {
			String message = productService.delete(idProduct);
			if ("No error".equals(message)) {
				model.addAttribute("successMessage", "Xóa sản phẩm thành công");
			} else if ("Invalid idProduct".equals(message)) {
				model.addAttribute("errorMessage", "Mã sản phẩm không hợp lệ");
			} else {
				model.addAttribute("errorMessage", "Sản phẩm không tồn tại");
			}
			return "forward:/product/show";
		}

	}
	
	@RequestMapping("/showAdd")
	public String showInsertProduct(HttpSession session, Model model) {
		if (session.getAttribute("sessionAccount") == null) {
			return "redirect:/login?error=1";
		} else {
			List<Category> listCategories = categoryService.findAll();
			model.addAttribute("listCategories", listCategories);
			
			return "createProduct";
		}
	}
	
	@PostMapping("/add")
	public String insertProduct(Model model, HttpSession session, @RequestParam("productName") String productName,
			@RequestParam("categoryId") String categoryId, @RequestParam("priceIn") String priceIn,
			@RequestParam("priceSell") String priceSell, @RequestParam("linkImage") String linkImage,
			@RequestParam("description") String description) {

		String errorMessage = productService.save(productName, categoryId, priceIn, priceSell, linkImage, description);
		if (session.getAttribute("sessionAccount") == null) {
			return "redirect:/login?error=1";
		} else {
			if ("No error".equals(errorMessage)) {
				model.addAttribute("successMessage", "Thêm sản phẩm thành công");
				return "forward:/product/show";
			} else if ("Duplicate ID Error".equals(errorMessage)) {
				model.addAttribute("errorMessage", "Mã sản phẩm đã tồn tại. Vui lòng thử lại");
			} else if ("Conflict foreign key".equals(errorMessage)) {
				model.addAttribute("errorMessage", "Mã thương hiệu không tồn tại. Vui lòng chọn đúng thương hiệu");
			} else if ("Required fields error".equals(errorMessage)) {
				model.addAttribute("errorMessage",
						"Lỗi chưa nhập Tên sản phẩm, Thương hiệu, Đơn giá nhập, Đơn giá bán!");
			} else if ("Invalid idCategory error".equals(errorMessage)) {
				model.addAttribute("errorMessage", "Id Thương hiệu phải là số");
			} else if ("Invalid priceIn error".equals(errorMessage)) {
				model.addAttribute("errorMessage", "Đơn giá nhập phải là số");
			} else if ("Invalid priceSell error".equals(errorMessage)) {
				model.addAttribute("errorMessage", "Đơn giá bán phải là số");
			} else {
				model.addAttribute("errorMessage", "Xảy ra lỗi không xác định, Vui lòng thử lại");
			}
			return "forward:/product/showAdd";
		}
	}
	
	@RequestMapping("/showEdit")
	public String showEditProduct(HttpSession session, Model model,
			@RequestParam(value = "idProduct", required = false) String idProduct) {
		if (session.getAttribute("sessionAccount") == null) {
			return "redirect:/login?error=1";
		} else {
			Product p = productService.findById(idProduct);
			System.err.println("show edit idProduct="+idProduct);
			if (p == null) {
				model.addAttribute("errorMessage", "Không thể chỉnh sửa sản phẩm. Sản phẩm không tồn tại");
				System.err.println("show edit controller");
				return "forward:/product/show";
			} else {
				List<Category> listCategories = categoryService.findAll();
				model.addAttribute("listCategories", listCategories);
				model.addAttribute("product", p);
				
				return "editProduct";
			}
		}
	}
	
	@PostMapping("/edit")
	public String editProduct(Model model, HttpSession session, @RequestParam("idProduct") String idProduct,
			@RequestParam("productName") String productName, @RequestParam("categoryId") String categoryId,
			@RequestParam("priceIn") String priceIn, @RequestParam("priceSell") String priceSell,
			@RequestParam("linkImage") String linkImage, @RequestParam("description") String description) {
		
		String errorMessage = productService.update(idProduct, productName, categoryId, priceIn, priceSell,
				linkImage, description);
		if (session.getAttribute("sessionAccount") == null) {
			return "redirect:/login?error=1";
		} else {
			if ("No error".equals(errorMessage)) {
				model.addAttribute("successMessage", "Chỉnh sửa sản phẩm thành công");
				return "forward:/product/show";
			} else if ("Product does not exist".equals(errorMessage)) {
				model.addAttribute("errorMessage", "Mã sản phẩm không tồn tại. Vui lòng thử lại");
				return "forward:/product/show";
			} else if ("Conflict foreign key".equals(errorMessage)) {
				model.addAttribute("errorMessage", "Mã thương hiệu không tồn tại. Vui lòng chọn đúng thương hiệu");
			} else if ("Required fields error".equals(errorMessage)) {
				model.addAttribute("errorMessage",
						"Lỗi chưa nhập Tên sản phẩm, Thương hiệu, Đơn giá nhập, Đơn giá bán!");
			} else if ("Invalid categoryId error".equals(errorMessage)) {
				model.addAttribute("errorMessage", "Id Thương hiệu phải là số");
			} else if ("Invalid priceIn error".equals(errorMessage)) {
				model.addAttribute("errorMessage", "Đơn giá nhập phải là số");
			} else if ("Invalid priceSell error".equals(errorMessage)) {
				model.addAttribute("errorMessage", "Đơn giá bán phải là số");
			} else {
				model.addAttribute("errorMessage", "Xảy ra lỗi không xác định, Vui lòng thử lại");
			}
			System.err.println("edit idProduct="+idProduct);
//			return "forward:/product/showEdit?idProduct=" + idProduct;
			return "forward:/product/showEdit";
		}
	}
}
