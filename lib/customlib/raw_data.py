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
    'shipping_area': '[{"country_id":"45","zone_ids":"-1"}]',
    'shipping_plan': '[{"name":"price_fee","shipping_method":"price","range_min":"0.00","range_max":-1,'
                     '"rate_amount":"0.00","payment_list":"cod;online;custom;credit_card","desc":"","range_unit":""},'
                     '{"name":"weight_fee","shipping_method":"weight","range_min":"0.00","range_max":-1,'
                     '"rate_amount":"0.00","payment_list":"cod;online;custom;credit_card","desc":"","range_unit":"g"},'
                     '{"name":"quantity_fee","shipping_method":"quantity","range_min":"0","range_max":-1,'
                     '"rate_amount":"0.00","payment_list":"cod;online;custom;credit_card","desc":"","range_unit":"g"}]',
    'has_other_country': 0
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
        "email": "12345@shippingaddress.com",
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

tax_batch_data = [
    {
        "id": "868",
        "country_code": "CN",
        "province_code": "ALL",
        "province_info": [

        ],
        "tax_rate": "60",
        "status": "open"
    },
    {
        "country_code": "CN",
        "province_code": "ANH",
        "province_info": {
            "province_id": "461",
            "name": "Anhui",
            "cn_name": "安徽",
            "code": "ANH"
        },
        "tax_rate": 0,
        "status": "open"
    },
    {
        "country_code": "CN",
        "province_code": "BJG",
        "province_info": {
            "province_id": "462",
            "name": "Beijing",
            "cn_name": "北京",
            "code": "BJG"
        },
        "tax_rate": 0,
        "status": "open"
    },
    {
        "country_code": "CN",
        "province_code": "CQG",
        "province_info": {
            "province_id": "463",
            "name": "Chongqing",
            "cn_name": "重庆",
            "code": "CQG"
        },
        "tax_rate": 0,
        "status": "open"
    },
    {
        "country_code": "CN",
        "province_code": "FJN",
        "province_info": {
            "province_id": "464",
            "name": "Fujian",
            "cn_name": "福建",
            "code": "FJN"
        },
        "tax_rate": 0,
        "status": "open"
    },
    {
        "country_code": "CN",
        "province_code": "GSU",
        "province_info": {
            "province_id": "465",
            "name": "Gansu",
            "cn_name": "甘肃",
            "code": "GSU"
        },
        "tax_rate": 0,
        "status": "open"
    },
    {
        "country_code": "CN",
        "province_code": "GDG",
        "province_info": {
            "province_id": "466",
            "name": "Guangdong",
            "cn_name": "广东",
            "code": "GDG"
        },
        "tax_rate": 0,
        "status": "open"
    },
    {
        "country_code": "CN",
        "province_code": "GXI",
        "province_info": {
            "province_id": "467",
            "name": "Guangxi",
            "cn_name": "广西",
            "code": "GXI"
        },
        "tax_rate": 0,
        "status": "open"
    },
    {
        "country_code": "CN",
        "province_code": "GZU",
        "province_info": {
            "province_id": "468",
            "name": "Guizhou",
            "cn_name": "贵州",
            "code": "GZU"
        },
        "tax_rate": 0,
        "status": "open"
    },
    {
        "country_code": "CN",
        "province_code": "HNN",
        "province_info": {
            "province_id": "469",
            "name": "Hainan",
            "cn_name": "海南",
            "code": "HNN"
        },
        "tax_rate": 0,
        "status": "open"
    },
    {
        "country_code": "CN",
        "province_code": "HBE",
        "province_info": {
            "province_id": "470",
            "name": "Hebei",
            "cn_name": "河北",
            "code": "HBE"
        },
        "tax_rate": 0,
        "status": "open"
    },
    {
        "country_code": "CN",
        "province_code": "HLJ",
        "province_info": {
            "province_id": "471",
            "name": "Heilongjiang",
            "cn_name": "黑龙江",
            "code": "HLJ"
        },
        "tax_rate": 0,
        "status": "open"
    },
    {
        "country_code": "CN",
        "province_code": "HNA",
        "province_info": {
            "province_id": "472",
            "name": "Henan",
            "cn_name": "河南",
            "code": "HNA"
        },
        "tax_rate": 0,
        "status": "open"
    },
    {
        "country_code": "CN",
        "province_code": "HKG",
        "province_info": {
            "province_id": "473",
            "name": "Hongkong SAR",
            "cn_name": "香港",
            "code": "HKG"
        },
        "tax_rate": 0,
        "status": "open"
    },
    {
        "country_code": "CN",
        "province_code": "HUB",
        "province_info": {
            "province_id": "474",
            "name": "Hubei",
            "cn_name": "湖北",
            "code": "HUB"
        },
        "tax_rate": 0,
        "status": "open"
    },
    {
        "country_code": "CN",
        "province_code": "HUN",
        "province_info": {
            "province_id": "475",
            "name": "Hunan",
            "cn_name": "湖南",
            "code": "HUN"
        },
        "tax_rate": 0,
        "status": "open"
    },
    {
        "country_code": "CN",
        "province_code": "IMO",
        "province_info": {
            "province_id": "476",
            "name": "Inner Mongolia",
            "cn_name": "内蒙古",
            "code": "IMO"
        },
        "tax_rate": 0,
        "status": "open"
    },
    {
        "country_code": "CN",
        "province_code": "JSU",
        "province_info": {
            "province_id": "477",
            "name": "Jiangsu",
            "cn_name": "江苏",
            "code": "JSU"
        },
        "tax_rate": 0,
        "status": "open"
    },
    {
        "country_code": "CN",
        "province_code": "JXI",
        "province_info": {
            "province_id": "478",
            "name": "Jiangxi",
            "cn_name": "江西",
            "code": "JXI"
        },
        "tax_rate": 0,
        "status": "open"
    },
    {
        "country_code": "CN",
        "province_code": "JLI",
        "province_info": {
            "province_id": "479",
            "name": "Jilin",
            "cn_name": "吉林",
            "code": "JLI"
        },
        "tax_rate": 0,
        "status": "open"
    },
    {
        "country_code": "CN",
        "province_code": "LNG",
        "province_info": {
            "province_id": "480",
            "name": "Liaoning",
            "cn_name": "辽宁",
            "code": "LNG"
        },
        "tax_rate": 0,
        "status": "open"
    },
    {
        "country_code": "CN",
        "province_code": "MAC",
        "province_info": {
            "province_id": "481",
            "name": "Macao SAR",
            "cn_name": "澳门",
            "code": "MAC"
        },
        "tax_rate": 0,
        "status": "open"
    },
    {
        "country_code": "CN",
        "province_code": "NXA",
        "province_info": {
            "province_id": "482",
            "name": "Ningxia",
            "cn_name": "宁夏",
            "code": "NXA"
        },
        "tax_rate": 0,
        "status": "open"
    },
    {
        "country_code": "CN",
        "province_code": "QHI",
        "province_info": {
            "province_id": "483",
            "name": "Qinghai",
            "cn_name": "青海",
            "code": "QHI"
        },
        "tax_rate": 0,
        "status": "open"
    },
    {
        "country_code": "CN",
        "province_code": "SAX",
        "province_info": {
            "province_id": "484",
            "name": "Shaanxi",
            "cn_name": "陕西",
            "code": "SAX"
        },
        "tax_rate": 0,
        "status": "open"
    },
    {
        "country_code": "CN",
        "province_code": "SAD",
        "province_info": {
            "province_id": "485",
            "name": "Shandong",
            "cn_name": "山东",
            "code": "SAD"
        },
        "tax_rate": 0,
        "status": "open"
    },
    {
        "country_code": "CN",
        "province_code": "SHA",
        "province_info": {
            "province_id": "486",
            "name": "Shanghai",
            "cn_name": "上海",
            "code": "SHA"
        },
        "tax_rate": 0,
        "status": "open"
    },
    {
        "country_code": "CN",
        "province_code": "SHX",
        "province_info": {
            "province_id": "487",
            "name": "Shanxi",
            "cn_name": "山西",
            "code": "SHX"
        },
        "tax_rate": 0,
        "status": "open"
    },
    {
        "country_code": "CN",
        "province_code": "SIC",
        "province_info": {
            "province_id": "488",
            "name": "Sichuan",
            "cn_name": "四川",
            "code": "SIC"
        },
        "tax_rate": 0,
        "status": "open"
    },
    {
        "country_code": "CN",
        "province_code": "TWA",
        "province_info": {
            "province_id": "489",
            "name": "Taiwan",
            "cn_name": "台湾",
            "code": "TWA"
        },
        "tax_rate": 0,
        "status": "open"
    },
    {
        "country_code": "CN",
        "province_code": "TJN",
        "province_info": {
            "province_id": "490",
            "name": "Tianjin",
            "cn_name": "天津",
            "code": "TJN"
        },
        "tax_rate": 0,
        "status": "open"
    },
    {
        "country_code": "CN",
        "province_code": "TBT",
        "province_info": {
            "province_id": "491",
            "name": "Tibet",
            "cn_name": "西藏",
            "code": "TBT"
        },
        "tax_rate": 0,
        "status": "open"
    },
    {
        "country_code": "CN",
        "province_code": "XJG",
        "province_info": {
            "province_id": "492",
            "name": "Xinjiang",
            "cn_name": "新疆",
            "code": "XJG"
        },
        "tax_rate": 0,
        "status": "open"
    },
    {
        "country_code": "CN",
        "province_code": "YUN",
        "province_info": {
            "province_id": "493",
            "name": "Yunnan",
            "cn_name": "云南",
            "code": "YUN"
        },
        "tax_rate": 0,
        "status": "open"
    },
    {
        "country_code": "CN",
        "province_code": "ZHE",
        "province_info": {
            "province_id": "494",
            "name": "Zhejiang",
            "cn_name": "浙江",
            "code": "ZHE"
        },
        "tax_rate": 0,
        "status": "open"
    }
]

store_update_data = {
    'store_id': 1160,
    'name': 'homer',
    'email': 'autotest@shoplazza.com',
    'seo_id': 0,
    'currency': 'USD',
    'url': None,
    'service_email': 'autotest@shoplazza.com',
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
