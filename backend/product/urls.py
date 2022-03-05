from django.urls import path
from rest_framework import routers
from product.views import ProductViewSet


router = routers.SimpleRouter()
router.register(r'products', ProductViewSet)


urlpatterns = []

urlpatterns += router.urls

