# Python Image Processing with Pillow

from PIL import Image
from PIL import ImageFont
from PIL import ImageDraw

# Open an image
filename = "day4datasets/Autumn Leaves.jpg"
base = Image.open(filename).convert("RGBA")

# Make a new black layer of image for the base
layer = Image.new("RGBA", base.size, (255,255,255,0))

# Draw something on the layer
img = ImageDraw.Draw(layer)

# Draw a circle
img.ellipse((600,300, 900, 600), fill=(200,0,0,170), outline=(255,255,255))

# Draw rectangle
img.rectangle((100, 100, 300, 200), fill = (0,200,0,170), outline = (255,255,255))

# Import font file
font_file = ImageFont.truetype("day4datasets/yahei.ttf", 80)
img.text((100, 600), "中文测试字体2024", font=font_file, fill=(255,255,255,100))

# Output
out = Image.alpha_composite(base, layer)
out.show()