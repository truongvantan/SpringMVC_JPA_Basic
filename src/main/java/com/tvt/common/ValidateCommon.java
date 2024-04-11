package com.tvt.common;

public class ValidateCommon {
	// kiểm tra một chuỗi có phải là số
	public static boolean isValidStringNumber(String s) {
		if (s == null || "".equals(s)) {
			return false;
		}
		return s.matches("^[0-9]+(\\.[0-9]+)?$");
	}

	public static boolean checkRequiredFields(String... strings) {
		String[] fields = strings;
		for (String s : fields) {
			if (s == null || "".equals(s)) {
				return false;
			}
		}
		return true;
	}

	public static String validateFieldsProduct(String productName, String idCategory, String priceIn,
			String priceSell) {
		if (!checkRequiredFields(productName, idCategory, priceIn, priceSell)) {
			return "Required fields error";
		}

		if (!isValidStringNumber(idCategory)) {
			return "Invalid idCategory error";
		}

		if (!isValidStringNumber(priceIn)) {
			return "Invalid priceIn error";
		}

		if (!isValidStringNumber(priceSell)) {
			return "Invalid priceSell error";
		}

		return "No error";
	}

	public static boolean isValidStringIntegerNumber(String s) {
		if (s == null || "".equals(s)) {
			return false;
		}
		return s.matches("^[0-9]+$");
	}
}
