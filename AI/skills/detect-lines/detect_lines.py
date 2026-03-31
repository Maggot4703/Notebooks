import cv2
import numpy as np

# Load the image
img = cv2.imread("Cars6.png")
if img is None:
    raise FileNotFoundError("Cars6.png not found in the current directory.")

# Convert to grayscale
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

# Threshold to isolate black lines (tune 100 as needed)
_, thresh = cv2.threshold(gray, 100, 255, cv2.THRESH_BINARY_INV)

# Edge detection
edges = cv2.Canny(thresh, 50, 150, apertureSize=3)

# Hough Line Transform to detect lines
lines = cv2.HoughLinesP(edges, 1, np.pi/180, threshold=100, minLineLength=80, maxLineGap=10)

# Draw detected lines on a copy of the original image
output = img.copy()
if lines is not None:
    for line in lines:
        x1, y1, x2, y2 = line[0]
        cv2.line(output, (x1, y1), (x2, y2), (0, 0, 255), 2)  # Red lines

# Save and display the result
cv2.imwrite("Cars6_black_lines_detected.png", output)
cv2.imshow("Detected Black Lines", output)
cv2.waitKey(0)
cv2.destroyAllWindows()
