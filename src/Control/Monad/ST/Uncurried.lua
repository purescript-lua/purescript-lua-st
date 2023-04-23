return {
  mkSTFn1 = function(fn)
    return function(x)
      return fn(x)()
    end
  end,

  mkSTFn2 = function(fn)
    return function(a, b)
      return fn(a)(b)()
    end
  end,

  mkSTFn3 = function(fn)
    return function(a, b, c)
      return fn(a)(b)(c)()
    end
  end,

  mkSTFn4 = function(fn)
    return function(a, b, c, d)
      return fn(a)(b)(c)(d)()
    end
  end,

  mkSTFn5 = function(fn)
    return function(a, b, c, d, e)
      return fn(a)(b)(c)(d)(e)()
    end
  end,

  mkSTFn6 = function(fn)
    return function(a, b, c, d, e, f)
      return fn(a)(b)(c)(d)(e)(f)()
    end
  end,

  mkSTFn7 = function(fn)
    return function(a, b, c, d, e, f, g)
      return fn(a)(b)(c)(d)(e)(f)(g)()
    end
  end,

  mkSTFn8 = function(fn)
    return function(a, b, c, d, e, f, g, h)
      return fn(a)(b)(c)(d)(e)(f)(g)(h)()
    end
  end,

  mkSTFn9 = function(fn)
    return function(a, b, c, d, e, f, g, h, i)
      return fn(a)(b)(c)(d)(e)(f)(g)(h)(i)()
    end
  end,

  mkSTFn10 = function(fn)
    return function(a, b, c, d, e, f, g, h, i, j)
      return fn(a)(b)(c)(d)(e)(f)(g)(h)(i)(j)()
    end
  end,

  runSTFn1 = function(fn)
    return function(a)
      return function()
        return fn(a)
      end
    end
  end,

  runSTFn2 = function(fn)
    return function(a)
      return function(b)
        return function()
          return fn(a, b)
        end
      end
    end
  end,

  runSTFn3 = function(fn)
    return function(a)
      return function(b)
        return function(c)
          return function()
            return fn(a, b, c)
          end
        end
      end
    end
  end,

  runSTFn4 = function(fn)
    return function(a)
      return function(b)
        return function(c)
          return function(d)
            return function()
              return fn(a, b, c, d)
            end
          end
        end
      end
    end
  end,

  runSTFn5 = function(fn)
    return function(a)
      return function(b)
        return function(c)
          return function(d)
            return function(e)
              return function()
                return fn(a, b, c, d, e)
              end
            end
          end
        end
      end
    end
  end,

  runSTFn6 = function(fn)
    return function(a)
      return function(b)
        return function(c)
          return function(d)
            return function(e)
              return function(f)
                return function()
                  return fn(a, b, c, d, e, f)
                end
              end
            end
          end
        end
      end
    end
  end,

  runSTFn7 = function(fn)
    return function(a)
      return function(b)
        return function(c)
          return function(d)
            return function(e)
              return function(f)
                return function(g)
                  return function()
                    return fn(a, b, c, d, e, f, g)
                  end
                end
              end
            end
          end
        end
      end
    end
  end,

  runSTFn8 = function(fn)
    return function(a)
      return function(b)
        return function(c)
          return function(d)
            return function(e)
              return function(f)
                return function(g)
                  return function(h)
                    return function()
                      return fn(a, b, c, d, e, f, g, h)
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end,

  runSTFn9 = function(fn)
    return function(a)
      return function(b)
        return function(c)
          return function(d)
            return function(e)
              return function(f)
                return function(g)
                  return function(h)
                    return function(i)
                      return function()
                        return fn(a, b, c, d, e, f, g, h, i)
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end,

  runSTFn10 = function(fn)
    return function(a)
      return function(b)
        return function(c)
          return function(d)
            return function(e)
              return function(f)
                return function(g)
                  return function(h)
                    return function(i)
                      return function(j)
                        return function()
                          return fn(a, b, c, d, e, f, g, h, i, j)
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end,
}
