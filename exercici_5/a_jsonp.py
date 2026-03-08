input_file = "offices.json"
output_file = "ofices.jsonp"
callback_name = "officesCallback"

with open(input_file, "r", encoding="utf-8") as f:
    json_data = f.read()

with open(output_file, "w", encoding="utf-8") as f:
    f.write(f"{callback_name}({json_data});")

print("Archivo JSONP creado correctamente!")