


def update_libro_stock(sender,instance, **kwargs):
    #actualizamos el stock si se elimina un pestamo
    instance.libro.stock += 1
    instance.libro.save()