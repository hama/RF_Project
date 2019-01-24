# -*- coding: utf-8 -*-
# from SeleniumLibrary import DynamicCore
# from lib.customlib import (kwshipping,
#                            kwproduct,
#                            kwcheckout,
#                            kwcollection,
#                            kwlogin,
#                            kwpayment,
#                            kwstore,
#                            kwtax,
#                            lib_utils)

# class lib(DynamicCore):
#     ROBOT_LIBRARY_SCOPE = 'GLOBAL'
#
#     def __init__(self):
#         libraries = [
#             Login(self)
#         ]
#
#         DynamicCore.__init__(self, libraries)
from lib.customlib import Login
__verison__ = "0.1.1"

class lib(Login):
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'
