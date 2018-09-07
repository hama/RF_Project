# -*- coding: utf-8 -*-

from SeleniumLibrary.base import DynamicCore
from lib.customlib import (kwshipping,
                           kwproduct,
                           kwcheckout,
                           kwcollection,
                           kwlogin,
                           kwmarketing,
                           kwpayment,
                           kwstore,
                           kwtax)
from lib.utils import lib_utils

# class lib(DynamicCore):
#     ROBOT_LIBRARY_SCOPE = 'GLOBAL'
#
#     def __init__(self):
#         libraries = [
#             AlertKeywords(self),
#             BrowserManagementKeywords(self),
#             CookieKeywords(self),
#             ElementKeywords(self),
#             FormElementKeywords(self),
#             FrameKeywords(self),
#             JavaScriptKeywords(self),
#             RunOnFailureKeywords(self),
#             ScreenshotKeywords(self),
#             SelectElementKeywords(self),
#             TableElementKeywords(self),
#             WaitingKeywords(self),
#             WindowKeywords(self)
#         ]
#         DynamicCore.__init__(self, libraries)