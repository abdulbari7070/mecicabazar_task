from django.shortcuts import render
from rest_framework import viewsets
from product.models import Product
from product.serializers import ProductSerializer


class ProductViewSet(viewsets.ModelViewSet):
    """
    Model viewset to handle CRUD
    """
    serializer_class = ProductSerializer
    queryset = Product.objects.all()
    