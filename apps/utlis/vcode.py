import random
from io import BytesIO

from PIL import Image, ImageDraw, ImageFont

_letter_cases = "abcdefghjkmnpqrstuvwxy"  # 小写字母，去除可能干扰的i，l，o，z
_upper_cases = _letter_cases.upper()  # 大写字母
_numbers = ''.join(map(str, range(3, 10)))  # 数字
init_chars = _letter_cases + _upper_cases + _numbers


def rand_color():
    return random.randint(0, 255), random.randint(0, 255), random.randint(0, 255)


def get_code_img_obj():
    img_obj = Image.new(mode='RGB', size=(150, 50), color=rand_color())
    draw = ImageDraw.Draw(img_obj, mode='RGB')
    font = ImageFont.truetype('static/font/kumo.ttf', size=40)
    ret_code = ''
    for i in range(4):
        s = random.choice(init_chars)
        ret_code += s
        draw.text((i * 25 + 20, 10), s, rand_color(), font=font)
    width, height = 150, 50
    for i in range(100):
        draw.point((random.randint(0, width), random.randint(0, height)), fill=rand_color())

    f = BytesIO()
    img_obj.save(f, 'png')
    img = f.getvalue()
    return img, ret_code
