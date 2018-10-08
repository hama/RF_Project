# -*- coding:utf-8 -*-
import sys

reload(sys)
sys.setdefaultencoding('utf-8')

# 含子商品的商品数据（max）
product_max_data_with_sub = {
    "has_only_default_variant": False,
    "variants": [
        {
            "option": [
                {
                    "option": "Color",
                    "option_value": "red"
                },
                {
                    "option": "Size",
                    "option_value": "min"
                }
            ],
            "price": 99,
            "compare_at_price": 199,
            "weight": "666",
            "weight_unit": "kg",
            "sku": "autotest_sku",
            "barcode": "autotest_barcode",
            "sales": 0,
            "inventory_management": True,
            "requires_shipping": 1,
            "taxable": 1,
            "inventory_policy": "continue"
        },
        {
            "option": [
                {
                    "option": "Color",
                    "option_value": "red"
                },
                {
                    "option": "Size",
                    "option_value": "mid"
                }
            ],
            "price": 99,
            "compare_at_price": 199,
            "weight": "666",
            "weight_unit": "kg",
            "sku": "autotest_sku",
            "barcode": "autotest_barcode",
            "sales": 0,
            "inventory_management": True,
            "requires_shipping": 1,
            "taxable": 1,
            "inventory_policy": "continue"
        },
        {
            "option": [
                {
                    "option": "Color",
                    "option_value": "black"
                },
                {
                    "option": "Size",
                    "option_value": "min"
                }
            ],
            "price": 99,
            "compare_at_price": 199,
            "weight": "666",
            "weight_unit": "kg",
            "sku": "autotest_sku",
            "barcode": "autotest_barcode",
            "sales": 0,
            "inventory_management": True,
            "requires_shipping": 1,
            "taxable": 1,
            "inventory_policy": "continue"
        },
        {
            "option": [
                {
                    "option": "Color",
                    "option_value": "black"
                },
                {
                    "option": "Size",
                    "option_value": "mid"
                }
            ],
            "price": 99,
            "compare_at_price": 199,
            "weight": "666",
            "weight_unit": "kg",
            "sku": "autotest_sku",
            "barcode": "autotest_barcode",
            "sales": 0,
            "inventory_management": True,
            "requires_shipping": 1,
            "taxable": 1,
            "inventory_policy": "continue"
        }
    ],
    "status": 1,
    "meta_title": "autotest_title",
    "meta_description": "autotest_description",
    "meta_keyword": "autotest_seo",
    "url": "/products/autotest_title",
    "barcode": "autotest_barcode",
    "title": "autotest_title",
    "brief": "autotest_subtitle",
    "description": "<p>autotest_description</p>",
    "images": [
        {
            "lastModified": 1530100037585,
            "lastModifiedDate": "2018-06-27T11:47:17.585Z",
            "name": "20180627194715.png",
            "size": 25125,
            "type": "image/png",
            "uid": "rc-upload-1536560132310-2",
            "response": {
                "url": "//cn.cdn.shoplazza.com/7ca156ec405c3c93b6742ca037978ecf.png",
                "path": "7ca156ec405c3c93b6742ca037978ecf.png"
            },
            "percent": 100,
            "originFileObj": {
                "uid": "rc-upload-1536560132310-2"
            },
            "status": "done",
            "url": "//cn.cdn.shoplazza.com/7ca156ec405c3c93b6742ca037978ecf.png",
            "path": "7ca156ec405c3c93b6742ca037978ecf.png"
        }
    ],
    "price": 99,
    "compare_at_price": 199,
    "product_type_id": 12,
    "product_type_cascade": [
        10,
        11,
        12
    ],
    "vendor": "autotest_supplier",
    "tags": [
        "autotest_tag"
    ],
    "options_with_values": [
        {
            "name": "Color",
            "values": [
                "red",
                "black"
            ]
        },
        {
            "name": "Size",
            "values": [
                "min",
                "mid"
            ]
        }
    ],
    "options": [
        "Color",
        "Size"
    ],
    "size_guide": "<p>autotest_<span lang=\"en\">sizechart</span></p>"
}

# 商品数据（max）
product_max_data = {
    'has_only_default_variant': True,
    'variants': [
        {
            'inventory_management': True,
            'requires_shipping': 1,
            'taxable': 1,
            'inventory_policy': 'continue',
            'inventory_quantity': 99,
            'weight': '66',
            'weight_unit': 'kg',
            'sku': 'autotest_sku',
            'price': 444,
            'barcode': 'autotest_barcode',
            'compare_at_price': 888
        }
    ],
    'status': 1,
    'meta_title': 'autotest_title',
    'meta_description': 'autotest_description',
    'meta_keyword': 'autotest_seo_keyword',
    'url': '/products/autotest_title',
    'barcode': 'autotest_barcode',
    'title': 'autotest_title',
    'description': '<pre>autotest_description</pre>',
    'tags': [
        'autotest_tag'
    ],
    'vendor': 'autotest_vendor',
    'price': 444,
    'compare_at_price': 888,
    'product_type_id': 12,
    'product_type_cascade': [
        10,
        11,
        12
    ],
    'size_guide': '<pre>autotest_sizechart</pre>',
    'brief': 'autotest_subtitle',
    'images': [
        {
            'lastModified': 1530156021840,
            'lastModifiedDate': '2018-06-28T03:20:21.840Z',
            'name': '20180628111909.png',
            'size': 235800,
            'type': 'image/png',
            'uid': 'rc-upload-1536632965111-18',
            'response': {
                'url': '//cn.cdn.shoplazza.com/a20f04b90aa1df9da8b6dcf35d03cbbd.png',
                'path': 'a20f04b90aa1df9da8b6dcf35d03cbbd.png'
            },
            'percent': 100,
            'originFileObj': {
                'uid': 'rc-upload-1536632965111-18'
            },
            'status': 'done',
            'url': '//cn.cdn.shoplazza.com/a20f04b90aa1df9da8b6dcf35d03cbbd.png',
            'path': 'a20f04b90aa1df9da8b6dcf35d03cbbd.png'
        }
    ]
}

# 商品数据（min）
product_min_data = {
    'has_only_default_variant': True,
    'variants': [
        {
            'inventory_management': False,
            'requires_shipping': 1,
            'taxable': 0,
            'inventory_policy': 'deny',
            'inventory_quantity': 0,
            'weight': '66',
            'weight_unit': 'kg',
            'sku': '',
            'price': 444,
            'barcode': ''
        }
    ],
    'status': 0,
    'meta_title': 'autotest_title',
    'meta_description': '',
    'meta_keyword': '',
    'url': '/products/autotest_title',
    'barcode': '',
    'title': 'autotest_title',
    'price': 444,
    'images': []
}

collecion_data = {
    'title': 'autotest_collection_name',
    'description': 'autotest_collection_description',
    'meta_title': 'autotest_collection_name',
    'meta_description': 'autotest_collection_description',
    'url': '/collections/autotest_collection_name',
    'meta_keyword': 'autotest_collection_seo',
    'image': {
        'lastModified': 1530152476341,
        'lastModifiedDate': '2018-06-28T02:21:16.341Z',
        'name': '20180628102113.png',
        'size': 272978,
        'type': 'image/png',
        'uid': 'rc-upload-1536908807832-2',
        'response': {
            'url': '//cdn.shoplazza.com/eee022100e586e73a103e94890dcc212.png',
            'path': 'eee022100e586e73a103e94890dcc212.png'
        },
        'percent': 100,
        'originFileObj': {
            'uid': 'rc-upload-1536908807832-2'
        },
        'status': 'done',
        'url': '//cdn.shoplazza.com/eee022100e586e73a103e94890dcc212.png',
        'path': 'eee022100e586e73a103e94890dcc212.png'
    }
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
    'shipping_name': 'autotest_shipping',
    'shipping_area': '[{"country_id":"44","zone_ids":"-1"}]',
    'has_other_country': 0,
    'shipping_plan': '[{"name":"price_fee","shipping_method":"price","range_min":0,'
                     '"range_max":-1,"rate_amount":0,"payment_list":"cod;online;custom;credit_card",'
                     '"desc":"","range_unit":"g"}]'
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
        'desc': None,
        'tips': None,
        'logo': None,
        'payment_channel': 'cod',
        'payment_rate': None,
        'transaction_fee': None,
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
    }
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
        "first_name": "name",
        "last_name": "lastname",
        "address": "addr",
        "address1": "addr1",
        "city": "city",
        "country_code": "CN",
        "province_code": "BE",
        "city_code": "",
        "area": "",
        "zip": "00000",
        "email": "12345@autotest.com",
        "phone": "123456789",
        "company": "company",
        "buyer_accepts_marketing": "on",
        "remember": "on",
        "customer_note": "",
        "order_token": "be6cb44f-402a-4728-84a1-c974ead1e97e",
        "country": "China",
        "province": "北京"
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
        "newsletter": 1
    }
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
    "shipping_address": {
        "country_code": "CN",
        "province_code": "BE"
    },
    "discount_code": "",
    "customer_info": {

    }
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

cart_add_data = {
    'product_id': '601',
    'variant_id': '641',
    'quantity': '1',
    'ref': '',
}

shipping_lines_data = {
    'country_code': 'CN',
    'province_code': 'BE',
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
