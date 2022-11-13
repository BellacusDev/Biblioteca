from django.shortcuts import render

from django.views.generic import ListView, DetailView

# models local
from .models import Libro


# Create your views here.


class ListaLibros(ListView):
    context_object_name = 'lista_libros'
    template_name = 'libro/lista.html'

    def get_queryset(self):
        palabra_clave = self.request.GET.get('kword', '')
        fecha_1 = self.request.GET.get('fecha1', '')
        fecha_2 = self.request.GET.get('fecha2', '')
        if fecha_1 and fecha_2:
            return Libro.objects.listar_libros2(palabra_clave, fecha_1, fecha_2)
        else:
            return Libro.objects.listar_libros(palabra_clave)


class ListaLibros2(ListView):
    context_object_name = 'lista_libros'
    template_name = 'libro/lista2.html'

    def get_queryset(self):
        return Libro.objects.listar_libros_caategoria('4')


class LibroDetailView(DetailView):
    model = Libro
    template_name = 'libro/detalle.html'


class ListaLibrosTrg(ListView):
    context_object_name = 'lista_libros'
    template_name = 'libro/lista.html'

    def get_queryset(self):
        palabra_clave = self.request.GET.get('kword', '')

        return Libro.objects.listar_libros_trg(palabra_clave)
