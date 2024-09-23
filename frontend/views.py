from django.shortcuts import render
from produto.models import Produto

def listar_produtos(request):
    produtos = Produto.objects.all()
    return render(request, 'frontend/listar_produtos.html', {'produtos': produtos})
