from django.http import HttpResponse

def hello(request):
    return HttpResponse("Hello from App Runner!", status=200)

def healthz(request):
    return HttpResponse("ok", status=200)
