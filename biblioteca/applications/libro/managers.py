import datetime

from django.db import models
from django.db.models import Q, Count

from django.contrib.postgres.search import TrigramSimilarity


class LibroManager(models.Manager):
    """managers para el modelo libro"""

    def listar_libros(self, kword):
        resultado = self.filter(
            titulo__icontains=kword
        )

        return resultado

    def listar_libros_trg(self, kword):
        if kword:
            resultado = self.filter(
                titulo__trigram_similar=kword,
            )
            return resultado
        else:
            return self.all()[:10]

    def listar_libros2(self, kword, fecha1, fecha2):
        resultado = self.filter(
            titulo__icontains=kword,
            fecha__range=(fecha1, fecha2)
        )
        return resultado

    def listar_libros_categoria(self, categoria):
        return self.filter(
            categoria__id=categoria
        ).order_by('titulo')

    def add_autor_libro(self, libro_id, autor):
        libro = self.get(id=libro_id)
        libro.autores.add(autor)
        return libro

    def libros_num_prestamo(self):
        resultado = self.aggregate(
            num_prestamos=Count('libro_prestamo')
        )
        return resultado

    def num_libros_prestados(self):
        resultado = self.annotate(
            num_prestados=Count('libro')
        )

        for r in resultado:
            print('****************')
            print(r, r.num_prestados)

        return resultado


class CategoriaManager(models.Manager):
    """manager para el modelo autor"""

    def categoria_por_autor(self, autor):
        return self.filter(
            categoria_libro__autores__id=autor
        ).distinct()

    def listar_categoria_libros(self):
        resultado = self.annotate(
            num_libros=Count('categoria_libro')
        )
        for r in resultado:
            print('************')
            print(r, r.num_libros)
        return resultado


