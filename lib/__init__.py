# -*- coding: utf-8 -*-

from SeleniumLibrary.base import DynamicCore
import sys,os
from lib.customlib import (kwshipping,
                           kwproduct,
                           kwcheckout,
                           kwcollection,
                           kwlogin,
                           kwmarketing,
                           kwpayment,
                           kwstore,
                           kwtax)
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