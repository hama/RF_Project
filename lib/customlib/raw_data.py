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
