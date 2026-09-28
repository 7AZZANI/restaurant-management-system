"""
Middleware for Restaurant Menu Management System.
Author: 7AZZANI (https://7azzani.com)
Donations & Support: https://7azzani.com/donation/
"""

class AuthorSignatureMiddleware:
    """
    Injects author signature and donation link into all HTTP response headers.
    """
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        response = self.get_response(request)
        response["X-Built-By"] = "7AZZANI.COM (https://7azzani.com)"
        response["X-Donation-Support"] = "https://7azzani.com/donation/"
        return response
