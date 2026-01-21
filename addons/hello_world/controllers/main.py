from odoo import http
from odoo.http import request


class HelloWorldController(http.Controller):

    @http.route('/hello', auth='public', website=True)
    def hello_world(self, **kw):
        return "<h1>Hello World</h1>"
