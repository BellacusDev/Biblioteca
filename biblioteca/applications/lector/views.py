from datetime import date

from django.shortcuts import render
from django.views.generic.edit import FormView
from django.http import HttpResponseRedirect

from .models import Prestamo
from .forms import PrestamoForm
# Create your views here.


class RegistrarPrestamo(FormView):
    template_name = 'lector/add_prestamo.html'
    form_class = PrestamoForm
    success_url = '.'

    def form_valid(self, form):

        prestamo = Prestamo(
            lector=form.cleaned_data['lector'],
            libro=form.cleaned_data['libro'],
            fecha_prestamo=date.today(),
            devuelto=False
        )

        """ Prestamo.objects.create(
            lector=form.cleaned_data['lector'],
            libro=form.cleaned_data['libro'],
            fecha_prestamo=date.today(),
            devuelto=False
        )"""
        prestamo.save()
        libro = form.cleaned_data['libro']
        libro.stock -= 1
        libro.save()

class AddPrestamo(FormView):
    template_name = 'lector/add_prestamo.html'
    form_class = PrestamoForm
    success_url = '.'

    def form_valid(self, form):

        obj, created = Prestamo.objects.get_or_create(
            lector=form.cleaned_data['lector'],
            libro=form.cleaned_data['libro'],
            devuelto=False,
            defaults={
                'fecha_prestamo': date.today()
            }
        )

        if created:
            return super(AddPrestamo, self).form_valid(form)
        else:
            return HttpResponseRedirect('/')


