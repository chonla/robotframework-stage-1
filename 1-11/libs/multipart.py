from requests_toolbelt import MultipartEncoder

def multipart_encode(fields, boundary=None, encoding='utf-8'):
  encoder = MultipartEncoder(fields=fields,boundary=boundary,encoding=encoding)
  return encoder