
from flask import Flask, jsonify, request
import os

try:
    from Crew.Crew import get_project_info, process_images, process_csv_data, process_excel_data, crop_from_annotations
except ImportError:
    from Crew import get_project_info, process_images, process_csv_data, process_excel_data, crop_from_annotations

app = Flask(__name__)

@app.route('/')
def home():
    info = get_project_info()
    return f"<h1>{info['name']} v{info['version']}</h1><p>{info['description']}</p>"

@app.route('/api/project-info')
def project_info():
    return jsonify(get_project_info())

@app.route('/api/process-images', methods=['POST'])
def api_process_images():
    data = request.get_json()
    image_dir = data.get('image_dir')
    output_dir = data.get('output_dir')
    grid_size = tuple(data.get('grid_size', (42, 32)))
    grid_color = data.get('grid_color', 'lightgrey')
    show_labels = data.get('show_labels', False)
    output_format = data.get('output_format')
    quality = data.get('quality', 95)
    if not image_dir or not output_dir:
        return jsonify({'error': 'image_dir and output_dir required'}), 400
    if not os.path.isdir(image_dir):
        return jsonify({'error': f'Input directory {image_dir} not found'}), 404
    os.makedirs(output_dir, exist_ok=True)
    saved = process_images(image_dir, output_dir, grid_size, grid_color, show_labels, output_format, quality)
    return jsonify({'processed': len(saved), 'output_files': saved})

@app.route('/api/process-csv', methods=['POST'])
def api_process_csv():
    data = request.get_json()
    csv_path = data.get('csv_path')
    if not csv_path or not os.path.isfile(csv_path):
        return jsonify({'error': 'Valid csv_path required'}), 400
    # This just prints info; for demo, return a message
    process_csv_data(csv_path)
    return jsonify({'message': f'Processed CSV: {csv_path}'})

@app.route('/api/process-excel', methods=['POST'])
def api_process_excel():
    data = request.get_json()
    excel_path = data.get('excel_path')
    sheet = data.get('sheet')
    if not excel_path or not os.path.isfile(excel_path):
        return jsonify({'error': 'Valid excel_path required'}), 400
    process_excel_data(excel_path, sheet)
    return jsonify({'message': f'Processed Excel: {excel_path}', 'sheet': sheet})

@app.route('/api/crop-from-annotations', methods=['POST'])
def api_crop_from_annotations():
    data = request.get_json()
    image_path = data.get('image_path')
    annotations_csv = data.get('annotations_csv')
    output_dir = data.get('output_dir')
    output_format = data.get('output_format')
    quality = data.get('quality', 95)
    if not image_path or not annotations_csv or not output_dir:
        return jsonify({'error': 'image_path, annotations_csv, and output_dir required'}), 400
    if not os.path.isfile(image_path):
        return jsonify({'error': f'Image file {image_path} not found'}), 404
    if not os.path.isfile(annotations_csv):
        return jsonify({'error': f'Annotations CSV {annotations_csv} not found'}), 404
    os.makedirs(output_dir, exist_ok=True)
    saved = crop_from_annotations(image_path, annotations_csv, output_dir, output_format, quality)
    return jsonify({'cropped': len(saved), 'output_files': saved})

if __name__ == '__main__':
    app.run(debug=True)
