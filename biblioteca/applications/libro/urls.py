from django.contrib import admin
from django.urls import path
from . import views

urlpatterns = [
    path('libros/',
         views.ListaLibros.as_view(),
         name='libros'
         ),
    path('libros2/',
         views.ListaLibros2.as_view(),
         name='libros2'
         ),
    path('libros-trg/',
         views.ListaLibrosTrg.as_view(),
         name='libros-trg'
         ),
    path('libro-detalle/<pk>',
         views.LibroDetailView.as_view(),
         name='libro-detalle'
         ),
]