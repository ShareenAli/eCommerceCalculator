//
//  AppConstant.swift
//  ZarJewels
//
//  Created by Priyank Ranka on 25/06/15.
//  Copyright (c) 2015 Nimap Infotech. All rights reserved.
//

import UIKit

class AppConstant: NSObject
{
    struct Static
    {
        static var BASE_URL = "http://180.149.247.134:8080/AmazonCalculator/"
        
//        static var BASE_URL = "http://www.vwalk.co.in/test_panel/testservices/BananaUniformService.svc/"
        
        static var AUTHENTICATION_ERROR = 404
        static var AUTHENTICATION_FAIL_MESSAGE = "Unable to authenticate user."
        
        static var REGISTRATION_SUCCESS = 3
        static var REGISTRATION_FAILURE = 4
        static var OTP_SUCCESS = 5
        
        static var NIMAP_ALERT_BASE_VIEW_WIDTH  : CGFloat =   280.0
        static var NIMAP_ALERT_BASE_VIEW_HEIGHT : CGFloat =   130.0
        static var NIMAP_ALERT_BASE_VIEW_EXTRA_HEIGHT : CGFloat =   180.0
        static var NIMAP_ALERT_BASE_VIEW_HUGE_HEIGHT : CGFloat =   200.0
        static var NIMAP_ALERT_LOGO_Y_PADDING   : CGFloat =   4.0
        static var NIMAP_ALERT_LOGO_Y_PADDING_FLOAT : Float = 0.0
        static var NIMAP_ALERT_LOGO_Y_PADDING_CGFLOAT : CGFloat = 0.5
        static var NIMAP_ALERT_TEXTFIELD_HEIGHT : Float = 32.0
        
        static var BUTTON_HEIGHT : Float = 40.0
        static var BUTTON_HEIGHT_CART : Float = 30.0
        
        static var CONNECTION_ERROR = 2
        static var PROCESSING_ERROR = 3
        
        static var GET_USER_TYPE_SUCCESS = 1
        static var GET_USER_TYPE_CONNECTION_ERROR_MESSAGE = "Connection Error"
        static var GET_USER_TYPE_PROCESSING_ERROR_MESSAGE = "Processing Error in getting user types"
        
        static var REGISTRATION_PAGE_TITLE_HEIGHT : Float = 40.0
        static var REGISTRATION_PAGE_TITLE_TOP_MARGIN : Float = 40.0
        
        static var REGISTRATION_FORM_COUNTRY_CODE_WIDTH : Float = 80.0
        static var REGISTRATION_FORM_FIELD_HEIGHT : Float = 30.0
        static var REGISTRATION_FORM_TITLE_PADDING_Y : Float = 20.0
        static var REGISTRATION_FORM_PADDING_Y : Float = 4.0
        static var REGISTRATION_FORM_PADDING_X : Float = 30.0
        
        static var REGISTRATION_BUTTON_PADDING_X : CGFloat = 30.0
        static var REGISTRATION_BUTTON_HEIGHT : CGFloat = 30.0
        
        static var REGISTRATION_FORM_FULL_NAME_VALIDATION_ERROR_MESSAGE = "Name cannot be empty!!"
        static var REGISTRATION_FORM_COMPANY_NAME_VALIDATION_ERROR_MESSAGE = "Company name cannot be empty!!"
        static var REGISTRATION_FORM_MOBILE_VALIDATION_ERROR_MESSAGE = "Mobile Number cannot be empty!!"
        static var REGISTRATION_FORM_MOBILE_VALIDATION_INVALID_MESSAGE = "Invalid Mobile No!!"
        static var REGISTRATION_FORM_CC_VALIDATION_ERROR_MESSAGE = "Country Code is not selected. Tap on the + 91 to select the proper country code."
        static var REGISTRATION_FORM_EMAIL_VALIDATION_ERROR_MESSAGE = "Invalid email id"
        static var REGISTRATION_FORM_EMAIL_EMPTY_ERROR_MESSAGE = "EmailId cannot be blank!!"
        static var REGISTRATION_FORM_USER_TYPE_VALIDATION_ERROR_MESSAGE = "Select one user type"
        static var REGISTRATION_USER_MESSAGE = "Please Wait... User Registering"
        static var REGISTRATION_AREA_MESSAGE = "Please select atleast 1 area of operation."
        
        static var GET_COUNTRY_CODE_SUCCESS = 1
        static var GET_COUNTRY_CODE_CONNECTION_ERROR_MESSAGE = "Connection Error"
        static var GET_COUNTRY_CODE_PROCESSING_ERROR_MESSAGE = "Processing Error in getting user types"
        
        static var ADD_USER_SUCCESS = 1
        static var ADD_USER_CONNECTION_ERROR_MESSAGE = "Connection Error"
        static var ADD_USER_PROCESSING_ERROR_MESSAGE = "Processing Error in adding user"
        
        static var OTP_TIME_LIMIT_ERROR_MESSAGE = "OTP has expired."
        static var OTP_INVALID_ERROR_MESSAGE = "Invalid OTP."
        
        static var SIGN_UP_PAGE_TITLE_HEIGHT : Float = 30.0
        static var SIGN_UP_PAGE_TITLE_TOP_MARGIN : Float = 60.0
        
        static var SIGN_UP_FORM_COUNTRY_CODE_WIDTH : Float = 80.0
        static var SIGN_UP_FORM_FIELD_HEIGHT : Float = 30.0
        static var SIGN_UP_FORM_TITLE_PADDING_Y : Float = 20.0
        static var SIGN_UP_FORM_PADDING_Y : Float = 4.0
        static var SIGN_UP_FORM_PADDING_X : Float = 30.0
        
        static var SIGN_UP_BUTTON_PADDING_X : CGFloat = 30.0
        static var SIGN_UP_BUTTON_HEIGHT : CGFloat = 30.0
        
        static var LOGIN_USER_SUCCESS = 1
        static var LOGIN_USER_EXCEPTION = 6
        static var LOGIN_USER_DATA_NOT_FOUND = 5
        static var LOGIN_USER_NOT_EXISTS = 4
        static var NO_RECORDS = 3
        
        static var LOGIN_USER_MESSAGE = "Please Wait... User Signing"
        static var LOGIN_USER_CONNECTION_ERROR_MESSAGE = "Connection Error"
        static var LOGIN_USER_PROCESSING_ERROR_MESSAGE = "Processing Error in signing user"
        static var LOGIN_USER_NOT_EXISTS_ERROR_MESSAGE = "You are not registered with us. Please register to create your account."
        
        static var GET_SUBCATEGORIES_SUCCESS = 1
        static var GET_FILTER_SUCCESS = 0
        static var GET_PRODUCTS_SUCCESS = 1
        
        static var PLACE_ORDER_SUCCESS = 1
        
        static var CATEGORY_CELL_CATEGORY_SCROLL_HEIGHT : CGFloat = 150.0
        static var CATEGORY_CELL_TITLE_HEIGHT : CGFloat = 30.0
        static var CATEGORY_CELL_HEIGHT : CGFloat = 200.0
        
        static var GET_CATEGORY_MESSAGE = "Please wait... Getting Categories"
        static var GET_CATEGORIES_CONNECTION_ERROR_MESSAGE = "Connection Error"
        static var GET_CATEGORIES_PROCESSING_ERROR_MESSAGE = "Processing Error in getting categories"
        static var UPDATE_PROFILE_COMPANY_ERROR_MESSAGE = "Company Name cannot be empty!!"
        
        static var SUB_CATEGORY_CELL_CATEGORY_SCROLL_HEIGHT : CGFloat = 190.0
        static var SUB_CATEGORY_CELL_TITLE_HEIGHT : CGFloat = 30.0
        static var SUB_CATEGORY_CELL_BUTTON_HEIGHT : CGFloat = 20.0
        
        static var SUB_CATEGORY_CELL_HEIGHT : CGFloat = 240.0
        static var SUB_CATEGORY_MORE_WIDTH : CGFloat = 70.0
        
        static var SUB_CATEGORY_CELL_PADDING : CGFloat = 5.0
        static var GET_SUB_CATEGORIES_MESSAGE = "Please wait... Getting sub categories"
        static var GET_SUB_CATEGORIES_CODE_SUCCESS = 1
        static var GET_SUB_CATEGORIES_CONNECTION_ERROR_MESSAGE = "Connection Error"
        static var GET_SUB_CATEGORIES_PROCESSING_ERROR_MESSAGE = "Processing Error in getting sub categories"
        
        static var SUB_CATEGORY_CELL_IMAGE_PADDING : CGFloat = 4.0
        
        static var GET_PRODUCTS_PAGINATION_SIZE = 10
        static var GET_PRODUCTS_MESSAGE = "Please Wait... Getting products"
        static var GET_PRODUCTS_CODE_SUCCESS = 1
        static var GET_PRODUCTS_CODE_ALL_PRODUCTS_DOWNLOADED = 4
        static var GET_PRODUCTS_CONNECTION_ERROR_MESSAGE = "Connection Error"
        static var GET_PRODUCTS_PROCESSING_ERROR_MESSAGE = "Processing Error in getting products"
        
        static var PRODUCT_CELL_HEIGHT : CGFloat = 220.0
        static var PRODUCT_CELL_WIDTH : CGFloat = 146.0
        
        static var GET_PRODUCT_DETAIL_MESSAGE = "Please Wait... Getting Product Details"
        static var GET_PRODUCT_DETAIL_CODE_SUCCESS = 1
        static var GET_PRODUCT_DETAIL_CONNECTION_ERROR_MESSAGE = "Connection Error"
        static var GET_PRODUCT_DETAIL_PROCESSING_ERROR_MESSAGE = "Processing Error in getting Product Details"
        
        static var GET_PRODUCT_DETAIL_BOTTOM_PATCH_PERCENTAGE : Float = 0.40
        static var PRODUCT_RATING_IMAGE_HEIGHT : Float = 20.0
        
        static var NAVIGATION_BAR_HEIGHT : CGFloat = 40.0
        static var NAVIGATION_BAR_BUTTON_WIDTH : CGFloat = 30.0
        static var NAVIGATION_BAR_PADDING_X : Float = 6.0
        
        static var REGISTRATION_BOTTOM_PATCH_PERCENTAGE : Float = 0.2
        static var REGISTRATION_BOTTOM_PATCH_TITLE_PADDING_Y : Float = 10.0
        static var REGISTRATION_BOTTOM_PATCH_PADDING_X : Float = 10.0
        static var REGISTRATION_BOTTOM_PATCH_BUTTON_PADDING_Y : Float = 10.0
        static var REGISTRATION_BOTTOM_PATCH_BUTTON_PADDING_Y_2 : Float = 30.0
        static var REGISTRATION_BOTTOM_PATCH_BUTTON_HEIGHT : Float = 30.0
        static var LINE_VIEW_HEIGHT : Float = 1.0
        
        static var CHECK_OUT_MESSAGE = "Please Wait... Placing Order"
        static var CHECK_OUT_SUCCESS = 1
        static var CHECK_OUT_FAILED = 2
        static var CHECK_OUT_CONNECTION_ERROR_MESSAGE = "Connection Error"
        static var CHECK_OUT_PROCESSING_ERROR_MESSAGE = "Processing Error while checking out"
        static var CHECK_OUT_SUCCESS_MESSAGE = "Your order has been placed successfully. Please track your order in My Order section."
        
        //Jainish
        
        static var PRODUCTDETAILS_IMAGE_PADDING_Y : Float = 60.0
        
        static var AVAILABILITY_PRODUCT_SUCCESS = 1
        
        static var PADDING : CGFloat = 10.0
        static var PADDING_SPECIFICATION : CGFloat = 3.0
        
        static var BORDERWIDTH : CGFloat = 1.0
        
        static var NO_PRODUCT_IN_CART_MESSAGE = "No product inside the cart. Please add product to cart."
        static var  PRODUCT_ALREADY_IN_CART = "Product is already added in cart."
        
        static var MY_CART_FIELD_HEIGHT : Float = 30.0
        static var MY_CART_FIELD_PADDING_X : Float = 10.0
        static var MY_CART_FIELD_PADDING_Y : Float = 4.0
        
        static var MY_CART_CELL_PADDING_X : CGFloat = 10.0
        static var MY_CART_CELL_IMAGE_DIM : CGFloat = 120.0
        static var MY_CART_CELL_HEIGHT : CGFloat = 160.0
        static var MY_CART_CELL_THUMBNAIL_HEIGHT : CGFloat = 230.0
        static var MY_CART_PRICE_WIDTH : CGFloat = 100.0
        static var MY_CART_PRICE_HEIGHT : CGFloat = 30.0
        static var MY_CART_ELEMENT_HEIGHT : CGFloat = 40.0
        static var MY_CART_DONE_BUTTON_HEIGHT : CGFloat = 30.0
        
        static var ADD_REVIEW_SUCCESS = 1
        static var NO_RATING_SELECTED_ERROR_MESSAGE = "Please select the star to rate the product."
        static var PRODUCT_RATING_CONNECTION_ERROR_MESSAGE = "Connection Error"
        static var PRODUCT_RATING_PROCESSING_ERROR_MESSAGE = "Processing Error while giving product rating and reviews."
        static var PRODUCT_RATING_SUCCESS_MESSAGE = "Thank you for your valuable feedback."
        static var PRODUCT_RATING_MESSAGE = "Please Wait... Adding Rating and Reviews"
        
        static var GET_PRODUCT_REVIEWS_SUCCESS = 1
        static var GET_PRODUCT_REVIEWS_MESSAGE = "Please Wait... Getting Rating and Reviews"
        static var GET_PRODUCT_REVIEWS_CONNECTION_ERROR_MESSAGE = "Connection Errorf"
        static var GET_PRODUCT_REVIEWS_PROCESSING_ERROR_MESSAGE = "Processing Error while getting product rating and reviews."
        
        static var REVIEW_CELL_USERNAME_HEIGHT : CGFloat = 30.0
        static var REVIEW_CELL_RATING_IMAGE_HEIGHT : CGFloat = 30.0
        static var REVIEW_CELL_PADDING_Y : CGFloat = 8.0
        
        static var REVIEW_CELL_READ_MORE_CHARACTER_LIMIT  = 80
        
        static var NO_DATA_AVAILABLE = -1
        static var NO_DATA_MESSAGE = "No data available"
        
        static var NO_PRODUCT_FILTER_RESULT = "No products found on the filter. Please apply another filters.";
        
        static var FEEDBACK_MAIL_SUBJECT = "Feedback : V-Walk"
        static var FEEDBACK_TO = "noreplyvwalk@gmail.com"
        static var FEEDBACK_MESSAGE = "Thank you for your valuable feedback. We will surely work towards the same."
        
        static var REQUEST_MAIL_SUBJECT = "Request A Sample : V-Walk"
        static var REQUEST_TO = "info@vwalk.in"
        
        static var SUPPORT_MAIL_SUBJECT = "Support : V-Walk"
        static var SUPPORT_TO = "noreplyvwalk@gmail.com"
        static var SUPPORT_MESSAGE = "Your query has been received. We will shortly address it."
        
        static var EMAIL_FAILED = "Email sending failed."
        static var EMAIL_SAVED = "Email saved in drafts."
        static var EMAIL_CANCELED = "Email Cancelled."
        
        static var UPDATE_PROFILE_SUCCESS = 1
        static var UPDATE_PROFILE_CITY_VALIDATION_ERROR_MESSAGE = "Please select City Name"
        static var UPDATE_PROFILE_MESSAGE = "Updating the profile"
        static var UPDATE_PROFILE_SUCCESS_MESSAGE = "Your details have been updated successfully"
        static var UPDATE_PROFILE_CONNECTION_ERROR_MESSAGE = "Connection Error"
        static var UPDATE_PROFILE_PROCESSING_ERROR_MESSAGE = "Processing Error Updating profile"
        static var UPDATE_PROFILE_EMPTY_ZIP_ERROR_MESSAGE = "Zip Code cannot be empty!!"
        static var UPDATE_PROFILE_INVALID_ZIP_ERROR_MESSAGE = "Invalid Zip Code"
        static var UPDATE_PROFILE_ADDRESS_ERROR_MESSAGE = "Address cannot be empty!!"
        
        static var GET_MYORDERS_SUCCESS = 1
        static var GET_MYORDERS_DETAIL_SUCCESS = 1
        static var GET_MYORDERS_MESSAGE = "Getting Orders"
        static var GET_MYORDERS_CONNECTION_ERROR_MESSAGE = "Connection error"
        static var GET_MYORDERS_CATEGORIES_PROCESSING_ERROR_MESSAGE = "Processing error getting orders"
        
        static var UPDATE_BOOKINGADDRESS_SUCCESS = 1
        
        static var GET_STATES_SUCCESS = 1
        static var GET_STATES_CONNECTION_ERROR_MESSAGE = "Connection error"
        static var GET_STATES_PROCESSING_ERROR_MESSAGE = "Processing error getting states"
        static var GET_STATES_MESSAGE = "Getting States"
        
        static var GET_CITIES_SUCCESS = 1
        static var GET_CITIES_CONNECTION_ERROR_MESSAGE = "Connection error"
        static var GET_CITIES_PROCESSING_ERROR_MESSAGE = "Processing error getting Cities"
        static var GET_CITIES_MESSAGE = "Getting Cities"
        
        //zar
        static var MY_CART_WEIGHT_WIDTH : CGFloat = 100.0
        static var MY_CART_WEIGHT_HEIGHT : CGFloat = 30.0
        
        static var SHIPPING_DETAIL_COMPANY_ERROR = "Company Name cannot be empty!!"
        static var SHIPPING_DETAIL_BOOKINGADDR_ERROR = "Booking Address cannot be empty!!"
        static var SHIPPING_DETAIL_MODETRANSPORT_ERROR = "Mode Of Transport cannot be empty!!"
        
        static var SEARCH_PRODUCT_MESSAGE = "Please Wait... Searching product"
        static var SEARCH_PRODUCT_CODE_SUCCESS = 1
        static var SEARCH_PRODUCT_CONNECTION_ERROR_MESSAGE = "Connection Error"
        static var SEARCH_PRODUCT_PROCESSING_ERROR_MESSAGE = "Processing Error"
        static var SEARCH_TEXT_VALIDATION_ERROR_MESSAGE = "Search bar cannot be blank!"
        
        static var FILTER_MASTER_PERCENTAGE_WIDTH : CGFloat = 0.40
        
        static var DEVICE_TOKEN_SUCCESS = 1
        
    }
}
