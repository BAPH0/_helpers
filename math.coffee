
###
-----------------------------------------------------------------------------------------------------------------
helpers/math
-----------------------------------------------------------------------------------------------------------------
###

# 通常の乱数
randomOfUniform = -> return Math.random()

# 乱数の加算：分布は直線的になり中央の値の出現率が高くなる
randomOfAdd = -> return ( Math.random() + Math.random() ) / 2

# 乱数の乗算：0.0付近の出現率が高い
randomOfMulti = -> return Math.random() * Math.random()

# 乱数の２乗：0.0付近の出現率が飛び抜けて高い
randomOfSquare = -> _r = Math.random(); return _r * _r

# 乱数の平方根：出現頻度が0.0から1.0まで直線的に増えていく
randomOfSqrt = -> return Math.sqrt Math.random()

# 正規乱数：中心部分が一番出現頻度が高く、中心から離れるほど頻度が急激に減少していく
randomOfNormal = ->
  calc = () ->
    r1 = Math.random()
    r2 = Math.random()
    r = Math.sqrt(-2.0 * Math.log(r1)) * Math.sin(2.0 * Math.PI * r2)
    # 値を0以上1未満になるよう正規化する
    return (r + 3) / 6
  # 0.0未満、1.0以上になるケースがあるためその時は再計算を行う
  loop
    _r = calc()
    if 0 <= _r and _r < 1
      break
  return _r

# 最大値を指定した乱数：max未満, algorithm指定
getMaxRandom = (max, algorithm) ->
  if not algorithm then algorithm = Math.random
  return algorithm() * max

# 最大値を指定した乱整数：max未満, algorithm指定
getMaxIntRandom = (max, algorithm) ->
  return Math.floor getMaxRandom(max, algorithm)

# 範囲指定の乱数：min以上, max未満, algorithm指定
getRangeRandom  = (min, max, algorithm) ->
  if not algorithm then algorithm = Math.random
  return (algorithm() * (max - min)) + min

# 範囲指定の乱整数：min以上, max未満, algorithm指定
getRangeIntRandom = (min, max, algorithm) ->
  return Math.floor getRangeRandom(min, max, algorithm)

# 配列からランダムで値を取り出す
getRandomArrayValue = (arr) ->
  return arr[ getMaxIntRandom(arr.length) ]

# 角度をラジアンに変換
getRadians = (angle) ->
  return angle * Math.PI / 180

# X方向のベクトル値
getVx = (radians, speed) ->
  return Math.cos(radians) * speed

# Y方向のベクトル値
getVy = (radians, speed) ->
  return Math.sin(radians) * speed

module.exports =
  randomOfUniform:randomOfUniform
  randomOfAdd:randomOfAdd
  randomOfMulti:randomOfMulti
  randomOfSquare:randomOfSquare
  randomOfSqrt:randomOfSqrt
  randomOfNormal:randomOfNormal
  getMaxRandom:getMaxRandom
  getMaxIntRandom:getMaxIntRandom
  getRangeRandom:getRangeRandom
  getRangeIntRandom:getRangeIntRandom
  getRandomArrayValue:getRandomArrayValue
  getRadians:getRadians
  getVx:getVx
  getVy:getVy
