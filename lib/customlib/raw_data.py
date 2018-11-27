# -*- coding:utf-8 -*-
import sys

reload(sys)
sys.setdefaultencoding('utf-8')

# 含子商品的商品数据（max）
product_max_data_with_sub = {
    "id": "",
    "title": "autotest_title",
    "brief": "autotest_subtitle",
    "description": "autotest_description",
    "published": True,
    "published_at": "",
    "need_variant_image": True,
    "requires_shipping": True,
    "taxable": True,
    "collection_ids": [

    ],
    "vendor": "autotest_supplier",
    "vendor_url": "https://autotest.com",
    "seo_title": "autotest_title",
    "seo_keywords": [
        "autotest_seo"
    ],
    "seo_url": "",
    "handle": "autotest_title",
    "seo_description": "autotest_description",
    "tags": [
        "auto_tag"
    ],
    "has_only_default_variant": False,
    "inventory_tracking": True,
    "inventory_policy": "continue",
    "images": [
        {
            "id": "",
            "image": {
                "path": "9b83ab55dd5078df84f05a51f912b063.jpeg",
                "alt": "",
                "aspect_ratio": "1.3333333333333333",
                "height": "504",
                "src": "//cdn.shoplazza.com/9b83ab55dd5078df84f05a51f912b063.jpeg",
                "width": "672",
                "size": "53455"
            }
        }
    ],
    "options": [
        {
            "name": "color",
            "values": [
                "red",
                "black"
            ]
        },
        {
            "name": "size",
            "values": [
                "min",
                "max"
            ]
        }
    ],
    "variants": [
        {
            "image": {
                "path": "9b83ab55dd5078df84f05a51f912b063.jpeg",
                "alt": "",
                "aspect_ratio": "1.3333333333333333",
                "height": "504",
                "src": "//cdn.shoplazza.com/9b83ab55dd5078df84f05a51f912b063.jpeg",
                "width": "672",
                "size": "53455"
            },
            "id": "",
            "price": "10",
            "compare_at_price": "20",
            "weight": "11",
            "weight_unit": "kg",
            "inventory_quantity": "999",
            "sku": "",
            "barcode": "",
            "option1": "red",
            "option2": "min",
            "option3": "",
            "_key": '{"color":"red","size":"min"}'
        },
        {
            "image": {
                "path": "9b83ab55dd5078df84f05a51f912b063.jpeg",
                "alt": "",
                "aspect_ratio": "1.3333333333333333",
                "height": "504",
                "src": "//cdn.shoplazza.com/9b83ab55dd5078df84f05a51f912b063.jpeg",
                "width": "672",
                "size": "53455"
            },
            "id": "",
            "price": "10",
            "compare_at_price": "20",
            "weight": "11",
            "weight_unit": "kg",
            "inventory_quantity": "999",
            "sku": "",
            "barcode": "",
            "option1": "red",
            "option2": "max",
            "option3": "",
            "_key": '{"color":"red","size":"max"}'
        },
        {
            "image": {
                "path": "9b83ab55dd5078df84f05a51f912b063.jpeg",
                "alt": "",
                "aspect_ratio": "1.3333333333333333",
                "height": "504",
                "src": "//cdn.shoplazza.com/9b83ab55dd5078df84f05a51f912b063.jpeg",
                "width": "672",
                "size": "53455"
            },
            "id": "",
            "price": "10",
            "compare_at_price": "20",
            "weight": "11",
            "weight_unit": "kg",
            "inventory_quantity": "999",
            "sku": "",
            "barcode": "",
            "option1": "black",
            "option2": "min",
            "option3": "",
            "_key": '{"color":"black","size":"min"}'
        },
        {
            "image": {
                "path": "9b83ab55dd5078df84f05a51f912b063.jpeg",
                "alt": "",
                "aspect_ratio": "1.3333333333333333",
                "height": "504",
                "src": "//cdn.shoplazza.com/9b83ab55dd5078df84f05a51f912b063.jpeg",
                "width": "672",
                "size": "53455"
            },
            "id": "",
            "price": "10",
            "compare_at_price": "20",
            "weight": "11",
            "weight_unit": "kg",
            "inventory_quantity": "999",
            "sku": "",
            "barcode": "",
            "option1": "black",
            "option2": "max",
            "option3": "",
            "_key": '{"color":"black","size":"max"}'
        }
    ]
}

# 商品数据（max）
product_max_data = {
    "id": "",
    "title": "autotest_title",
    "brief": "autotest_subtitle",
    "description": "autotest_description",
    "published": True,
    "published_at": "",
    "need_variant_image": False,
    "requires_shipping": True,
    "taxable": True,
    "collection_ids": [

    ],
    "vendor": "autotest_supplier",
    "vendor_url": "https://autotest.com",
    "seo_title": "autotest_title",
    "seo_keywords": [
        "autotest_seo"
    ],
    "seo_url": "",
    "handle": "autotest_title",
    "seo_description": "autotest_description",
    "tags": [
        "auto_tag"
    ],
    "has_only_default_variant": True,
    "inventory_tracking": True,
    "inventory_policy": "continue",
    "images": [
        {
            "id": "",
            "image": {
                "path": "9b83ab55dd5078df84f05a51f912b063.jpeg",
                "alt": "",
                "aspect_ratio": "1.3333333333333333",
                "height": "504",
                "src": "//cdn.shoplazza.com/9b83ab55dd5078df84f05a51f912b063.jpeg",
                "width": "672",
                "size": "53455"
            }
        }
    ],
    "options": [

    ],
    "variants": [
        {
            "compare_at_price": "888",
            "barcode": "123456",
            "sku": "autotestsku",
            "inventory_quantity": "77",
            "weight": "123",
            "price": "444",
            "id": "",
            "image": None,
            "weight_unit": "kg",
            "option1": "",
            "option2": "",
            "option3": "",
            "_key": "{}"
        }
    ]
}

# 商品数据（min）
product_min_data = {
    "id": "",
    "title": "autotest_title",
    "brief": "",
    "description": "",
    "published": False,
    "published_at": "",
    "need_variant_image": False,
    "requires_shipping": False,
    "taxable": False,
    "collection_ids": [

    ],
    "vendor": "",
    "vendor_url": "",
    "seo_title": "autotest_title",
    "seo_keywords": [

    ],
    "seo_url": "",
    "handle": "autotest_title",
    "seo_description": "",
    "tags": [

    ],
    "has_only_default_variant": True,
    "inventory_tracking": False,
    "inventory_policy": "continue",
    "images": [
        {
            "id": "",
            "image": {
                "path": "9b83ab55dd5078df84f05a51f912b063.jpeg",
                "alt": "",
                "aspect_ratio": "1.3333333333333333",
                "height": "504",
                "src": "//cdn.shoplazza.com/9b83ab55dd5078df84f05a51f912b063.jpeg",
                "width": "672",
                "size": "53455"
            }
        }
    ],
    "options": [

    ],
    "variants": [
        {
            "compare_at_price": "888",
            "price": "444",
            "id": "",
            "image": None,
            "weight": "",
            "weight_unit": "kg",
            "inventory_quantity": "",
            "sku": "",
            "barcode": "",
            "option1": "",
            "option2": "",
            "option3": "",
            "_key": "{}"
        }
    ]
}

collecion_data = {
    "id": "",
    "title": "autotest_collection_name",
    "description": "autotest_collection_description",
    "image": {
        "path": "9b83ab55dd5078df84f05a51f912b063.jpeg",
        "alt": "",
        "aspect_ratio": "1.3333333333333333",
        "height": "504",
        "src": "//cdn.shoplazza.com/9b83ab55dd5078df84f05a51f912b063.jpeg",
        "width": "672",
        "size": "53455"
    },
    "seo_title": "autotest_collection_name",
    "seo_url": "",
    "handle": "autotest_collection_name",
    "seo_description": "autotest_collection_description",
    "seo_keywords": [
        "autotest_collection_seo"
    ],
    "products": [

    ],
    "_": 1542884025491,
    "product_ids": [

    ]
}

comment_data = {
    'star': '5',
    'content': 'autotest_comment_content',
    'praise': '99',
    'status': '1',
    'uname': 'autotester@autotest.com',
    'product_id': 000,
    # 'img_link': ['//cn.cdn.shoplazza.com/d330406101ae1c48e33ed1f29f77c8b2.jpg'],
    'ctime': '2018-9-28 10:10:10'
}

shipping_data = {
    "name": "autotest_shipping",
    "areas": [
        {
            "country_code": "CN",
            "country_name": "中国",
            "province_codes": [
                "ALL"
            ]
        }
    ],
    "plans": [
        {
            "name": "price_fee",
            "desc": "price_fee_description",
            "rule_type": "price",
            "rule_range_min": 0,
            "rule_range_max": 0,
            "rule_range_infinite": True,
            "rule_range_unit": "USD",
            "support_cod": True,
            "rate_type": "normal",
            "rate_amount": "0"
        },
        {
            "name": "quantity_fee",
            "desc": "quantity_fee_description",
            "rule_type": "quantity",
            "rule_range_min": 0,
            "rule_range_max": 0,
            "rule_range_infinite": True,
            "rule_range_unit": "件",
            "support_cod": True,
            "rate_type": "normal",
            "rate_amount": "0"
        },
        {
            "name": "weight_fee",
            "desc": "weight_fee_description",
            "rule_type": "weight",
            "rule_range_min": 0,
            "rule_range_max": 0,
            "rule_range_infinite": True,
            "support_cod": True,
            "rate_type": "normal",
            "rate_amount": "0",
            "rule_range_unit": "g"
        }
    ]
}

checkout_create_data = {
    'line_items': [
        {
            'quantity': 1,
            'variant_id': 628,
            'note': ''
        }
    ],
    'refer_info': {
        'source': 'cart'  # source:buy_now/cart
    }
}

payment_pay_data = {
    'order_token': 'be6cb44f-402a-4728-84a1-c974ead1e97e',
    'payment_line': {
        'id': '1',
        'name': 'Cash on Delivery',
        'desc': '',
        'tips': '',
        'logo': '',
        'payment_channel': 'cod',
        'payment_rate': '0.0000',
        'transaction_fee': '0.0000',
        'is_enable': '1',
        'is_active': True,
        'payment_method': 'cod',
        'public_key': None
    },
    'card_info': {

    },
    'need_billing_address': 0,
    'billing_address_info': {
        'first_name': '',
        'last_name': '',
        'address': '',
        'address1': '',
        'city': '',
        'country_code': '',
        'province_code': '',
        'zip': ''
    },
    'checkout_token': 'PYwViKKDF9v0nOuMnuAtCtbOYzooA1J1DrnWh2NuLE4%3D'
}

place_order_data = {
    "order_token": "be6cb44f-402a-4728-84a1-c974ead1e97e",
    "shipping_line": {
        "name": "price_fee",
        "desc": "",
        "range_min": "0.00",
        "range_max": "-1.00",
        "range_unit": "",
        "rate_amount": "0.00",
        "shipping_method": "price",
        "payment_list": [
            "cod",
            "online",
            "custom",
            "credit_card"
        ],
        "id": "21"
    },
    "shipping_address": {
        "id": "",
        "first_name": "firstname",
        "last_name": "lastname",
        "phone_area_code": "86",
        "phone": "18888888888",
        "company": "company",
        "email": "12345@autotest.com",
        "country": "China",
        "country_code": "CN",
        "province": "Beijing",
        "province_code": "BJG",
        "address": "address",
        "address1": "address1",
        "zip": "00000",
        "city": "city"
    },
    "discount_code": "",
    "prices": {
        "total_price": 444,
        "subtotal_price": 444,
        "shipping_price": 0,
        "tax_price": 0,
        "discount_price": 0,
        "discount_line_item_price": 0,
        "discount_code_price": 0
    },
    "customer_info": {
        "note": "",
        "newsletter": 1,
        "email": "12345@autotest.com"
    },
    "save_address": 1,
    "checkout_token": "PYwViKKDF9v0nOuMnuAtCtbOYzooA1J1DrnWh2NuLE4%3D"
}

price_calculate_data = {
    "order_token": "be6cb44f-402a-4728-84a1-c974ead1e97e",
    "shipping_line": {
        "name": "price_fee",
        "desc": "",
        "range_min": "0.00",
        "range_max": "-1.00",
        "range_unit": "",
        "rate_amount": "0.00",
        "shipping_method": "price",
        "payment_list": [
            "cod",
            "online",
            "custom",
            "credit_card"
        ],
        "id": "21"
    },
    "prices": {
        "subtotal_price": "444.00",
        "shipping_price": "0.00",
        "tax_price": "0.00",
        "discount_code_price": "0.00",
        "discount_price": "0.00",
        "total_price": "444.00",
        "discount_line_item_price": "0.00"
    },
    "shipping_address": {
        "country_code": "CN",
        "province_code": "BJG"
    },
    "discount_code": "",
    "customer_info": {

    },
    "checkout_token": "PYwViKKDF9v0nOuMnuAtCtbOYzooA1J1DrnWh2NuLE4%3D"
}

# /api/payment/method这个接口的编辑数据
payment_method_edit_data = {
    "method_name": "Cash on Delivery",
    "method_desc": "desc",
    "method_tips": "tips",
    "payment_method": "cod"
}

# /api/payment/method这个接口的激活数据
payment_method_activation_data = {
    "payment_method": "cod",
    "method_is_enable": 0
}

payment_channel_data = {
    "client_id": "10000009446",
    "secret_key": "30820122300d06092a864886f70d01010105000382010f003082010a028201010098da23b3f3e679efb33e8171191e165ca1a757e53e74393cd23a0bf9adbbaecdd8224c4666ed421ce6b099e66807e85e4247c07261792a66ccbd71cc8fb7e87c34e2bcf2ffb5df9004488ec3a32353e91cadc56cf980eda1784186c1c270587907e2db749fd904dc39b28670699dd654a6001e0289e2988648ae3fca5e45ed356d1a81a84029357eb017f925c8dc174ce82ac12b8681282abb5e83aef1fa6416f3fba32cb45432f51a700f995ccee4d8a9dea66d31607f14a546011ec44807056f54330389e78b12d355527ab62e904f8918c8f417e0afaf154b772fc5dce7aac4a71426f9a623155484d8c7f73e2511f1866661b3a8083ea087f3162cf3aa090203010001",
    "payment_method": "credit_card",
    "payment_channel": "ipaylinks"
}

payment_channel_change_channel_data = {
    "channel_is_enable": "1",
    "payment_method": "credit_card",
    "payment_channel": "ipaylinks"
}

cart_add_data = {
    'product_id': '601',
    'variant_id': '641',
    'quantity': '1',
    'ref': '',
}

shipping_lines_data = {
    'country_code': 'CN',
    'province_code': 'BJG',
    'order_token': '2e043a92-46c5-4f26-953a-88f347cd1e08'
}

# 订单列表数据查询入参数据
query_orders_data = {
    'page': '1',
    'per_page': '10',
    'deal_status': 'dealing'
}

# 通用列表数据查询入参数据
query_list_data = {
    'page': '0',
    'limit': '20'
}

orders_fulfillments_data = {
    "line_item_ids": [
        "016c78d3-4d40-4b90-904a-03da5e40540d",
        "37db26d6-18c6-4b9f-b366-8e19f31eccc5"
    ],
    "retrieve_method": "manual",
    "tracking_number": "autotest_tracking_number",
    "tracking_company": "其他",
    "tracking_company_code": "-1"
}

checkout_save_data = {
    "customer_authority": 1,
    "name": "separate",
    "company": "optional",
    "email": "optional",
    "phone": "optional",
    "refund_policy": "",
    "privacy_policy": "",
    "server_policy": "",
    "customer_contact": 3,
    "customer_email": 1,
    "customer_phone": 1,
    "customer_name": 2,
    "company_setting": 2,
    "postcode_setting": 2
}

coupon_code_refresh_data = {
    "id": "0",
    "name": "autotest_activity_name",
    "code": "U8GFH5L1",
    "date_start": "2018-10-17 00:00:00",
    "date_end": "-1",
    "code_type": "",
    "discount_type": "2",
    "range_type": "1",
    "range_value": "",
    "code_value": "10",
    "total_num": "-1",
    "limit_num": "-1",
    "product_scope": "1",
    "is_enable": "",
    "date_added": "",
    "progress": "",
    "timezone": "",
    "product_list": "",
    "used_num": "",
    "product_num": "",
    "stock_num": ""
}

store_update_data = {
    'store_id': 1160,
    'name': 'homer',
    'email': 'autotest@autotest.com',
    'seo_id': 0,
    'currency': 'USD',
    'url': None,
    'service_email': 'autotest@autotest.com',
    'icon': {
        'src': '//cdn.shoplazza.com/c9f9562678e0febfde4d739a941484fc.jpg',
        'alt': '',
        'path': 'c9f9562678e0febfde4d739a941484fc.jpg'
    },
    'time_zone': '+0800',
    'country_code': '',
    'province_code': 'ALL',
    'city': None,
    'address': None,
    'zip': None,
    'phone': '18888888888',
    'code': '',
    'symbol_left': '$',
    'symbol_right': '',
    'hour': 8,
    'symbol': '$',
    'meta_title': '',
    'meta_keyword': '',
    'meta_description': '',
    '_': '',
    'id': 25,
    'status': 'open',
    'created_at': '2018-10-20 16:40:10',
    'updated_at': '2018-10-20 16:40:10',
    "country": "",
    "province": "ALL"
}

file_list_data = {
    'folder': 'product',
    'page': '1',
    'limit': '10'
}
