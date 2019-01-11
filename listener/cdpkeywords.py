import PyChromeDevTools

"""Listener that stops execution if a test fails."""

ROBOT_LISTENER_API_VERSION = 3


class cdpkeywords():
    ROBOT_LIBRARY_SCOPE = 'Global'
    def __init__(self):
        self.chrome = None

    def start_test(self):
        self.chrome = PyChromeDevTools.ChromeInterface()
        self.chrome.Network.enable()
        self.chrome.Page.enable()

    def end_test(self):
        messages1 = self.chrome.pop_messages()
        print 'messages1:' + str(len(messages1))
