# -*- coding:utf-8 -*-
import json


def get_response_by_api_py(response_map, api):
    key_list = response_map.keys()
    for key in key_list:
        if api in key:
            print "url: " + key
            print "status: " + str(response_map[key]['status'])
            print "responseText: " + json.dumps(response_map[key])
            return json.dumps(response_map[key])
