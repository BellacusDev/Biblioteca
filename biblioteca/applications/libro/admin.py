from django.contrib import admin
from .models import Libro, Categoria
# Register your models here.

admin.site.register(Categoria)
admin.site.register(Libro)
