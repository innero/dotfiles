import requests_html as r
from bs4 import BeautifulSoup as bs
from functools import partial
from selenium import webdriver
import time
headers = {'User-Agent': """Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, 
                              like Gecko) Chrome/70.0.3538.77 Safari/537.36"""}



class AdidasBuyer:
    def __init__(self):
        self.user_session = None

    def is_merchandise_online(self, merchandise_code=None):
        s = self.user_session or r.HTMLSession()
        if isinstance(merchandise_code, str):
            resp = s.get(f'https://www.adidas.com.cn/item/{merchandise_code}')
            return resp.status_code == 200 and '404400' not in resp.text
        return False

    def is_user_cookie_valid(self):
        if self.user_session is not None:
            resp_text = self.user_session.get('https://www.adidas.com.cn/member/profile').text
            return 'adiCLUB 账户' in resp_text
        return False

    def login(self, phone, password):
        if self.is_user_cookie_valid():
            return True
        else:
            s = r.HTMLSession()
            login_page_resp = s.get('https://www.adidas.com.cn/member/login')
            if login_page_resp.status_code != 200:
                return False
            login_page_resp.html.render()
            rendered = login_page_resp.html.raw_html
            b = bs(str(rendered, 'utf-8'), 'lxml')
            print(b.select("""input[name='_csrf']""")[0])
            attrs = b.select("""a[id="loginNewBtn"]""")[0].attrs
            u, v = attrs.get('u'), attrs.get('v')
            post_to = f'https://www.adidas.com.cn{u}'
            login_data = {
                'isRemberMeLoginName': False,
                'loginName': phone,
                'password': password,
                'v': v
            }
            print('login_data', login_data)
            pr = s.post(post_to, data=login_data)
            print(pr.text)
            self.user_session = s
            return self.is_user_cookie_valid()


a = AdidasBuyer()
print(a.is_merchandise_online('BB35289'))
# b = a.login('18652946552', 'Zhahaya1991')
# print(b)
