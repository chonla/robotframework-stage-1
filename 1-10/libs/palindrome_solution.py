import re

def is_palindrome(s):
  s = s.lower()
  s = re.sub('[^a-z]', '', s)
  l = len(s)
  for i in range(0, int(l/2)):
    if s[i] != s[l - i - 1]:
      return False
  return True

def should_be_palindrome(s):
  r = is_palindrome(s)
  if not r:
    raise Exception('the string {0} should be palindrome, but it is not'.format(s))

def should_not_be_palindrome(s):
  r = is_palindrome(s)
  if r:
    raise Exception('the string {0} should not be palindrome, but it is'.format(s))
