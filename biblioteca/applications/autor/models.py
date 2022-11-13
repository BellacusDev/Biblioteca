from django.db import models
from .managers import AutorManager
# Create your models here.


class Persona(models.Model):

    nombres = models.CharField(
        max_length=50
    )
    apellidos = models.CharField(
        max_length=50
    )
    nacionalidad = models.CharField(
        max_length=20
    )
    edad = models.PositiveIntegerField()

    def __str__(self):
        return str(self.id) + ' ' + self.nombres + '-' + self.apellidos

    class Meta:
        abstract = True


class Autor(Persona):

    seudonimo = models.CharField(
        'Seudonimo', max_length=50,
        blank=True,
    )
    objects = AutorManager()


