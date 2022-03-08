from django.shortcuts import render
from rest_framework import viewsets
from product.models import Product
from product.serializers import ProductSerializer
from product.documents import ProductDocument


class ProductViewSet(viewsets.ModelViewSet):
    """
    Model viewset to handle CRUD
    """
    serializer_class = ProductSerializer
    queryset = Product.objects.all()
    
    def get_queryset(self):
        queryset = super(ProductViewSet, self).get_queryset()
        product_name = self.request.GET.get('search', None)
        if product_name:
            queryset = ProductDocument.search().query("fuzzy", name=product_name).to_queryset()
        return queryset