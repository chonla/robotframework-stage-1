import datetime

def date_is_ascendingly_sorted(data):
  d = datetime.datetime.strptime(data[0], "%Y-%m-%d")
  data = data[1:]
  for e in data:
    di = datetime.datetime.strptime(e, "%Y-%m-%d")
    if di < d:
      raise Exception('date should be sorted ascendingly, but they are not')
    else:
      d = di
