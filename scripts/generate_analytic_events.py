import ast
import urllib.request

""" CONFIGURATION """

SPREADSHEET_ID = '1dq_Ur7s-X87U6P7AiL-_-ahFBsZCoUUjVvXNqYt1BYE'
SHEET_NAME = 'Events' # Note that the sheet name has to be URL encoded

BASE_URL = 'https://docs.google.com/spreadsheets/d/' + SPREADSHEET_ID
CSV_DOWNLOAD_URL = BASE_URL + '/gviz/tq?tqx=out:csv&sheet=' + SHEET_NAME


""" UTILS """

def to_camel_case(snake_str):
    components = snake_str.split('_')
    return components[0] + ''.join(x.title() for x in components[1:])


""" TEMPLATES """

TEMPLATE_WITH_PARAMS = """
extension AnalyticEvent {
    public static func <EVENT_NAME>(
        <INIT_PARAMS>
    ) -> AnalyticEvent {
        return AnalyticEvent(
            eventName: "<NAME>",
            parameters: [
                <EVENT_PARAMS_DICT>
            ]
        )
    }
}"""

TEMPLATE_ONLY_EVENT = """
extension AnalyticEvent {
    public static var <EVENT_NAME>: AnalyticEvent {
        return AnalyticEvent(
            eventName: "<NAME>",
            parameters: [:]
        )
    }
}"""


""" SHEET_CONTENT_LOADING """

sheet_content = ""

with urllib.request.urlopen(CSV_DOWNLOAD_URL) as response:
    sheet_content = response.readlines()

# Get rows from sheet content
events = {}
for index, line in enumerate(sheet_content):
    if index < 1:
        continue

    line = line.decode("utf-8")
    line_list = ast.literal_eval(line)
    events[line_list[0]] = [param for param in list(line_list[2:10]) if param]


""" EVENTS PROCESSING"""

# Create code for classes by substituting placeholders in the template
classes = []
for event_key in sorted(events):

    # Create class name
    camel_cased = to_camel_case(event_key)
    event_name = camel_cased[0].lower() + camel_cased[1:]

    if events[event_key]:
        processed_template = TEMPLATE_WITH_PARAMS.replace('<EVENT_NAME>', event_name)
        # Iterate over parameter values
        properties = []
        params_map = []
        init_params = []
        init_assignments = []
        for param in events[event_key]:
            parts = [param_key.strip() for param_key in param.split(':')]
            properties.append('public let ' + to_camel_case(parts[0]) + ': ' + parts[1])
            params_map.append('"' + parts[0] + '"' + ' : ' + to_camel_case(parts[0]))
            init_params.append(to_camel_case(parts[0]) + ': ' + parts[1])
            init_assignments.append(f"self.{to_camel_case(parts[0])} = {to_camel_case(parts[0])}")

        # Concatenate individual parameters into one string
        properties = '\n\t'.join(properties)
        params_map = ',\n\t\t\t\t'.join(params_map) if params_map != [] else ':'
        init_params = ',\n\t\t'.join(init_params)
        init_assignments = '\n\t\t'.join(init_assignments)

        # Replace placeholders with values
        processed_template = processed_template.replace('<NAME>', event_key)
        processed_template = processed_template.replace('<EVENT_PARAMS_PROPERTIES>', properties)
        processed_template = processed_template.replace('<EVENT_PARAMS_DICT>', params_map)
        processed_template = processed_template.replace('<INIT_PARAMS>', init_params)
        processed_template = processed_template.replace('<INIT_ASSIGNMENTS>', init_assignments)
        processed_template = processed_template + '\n'

    else:
        processed_template = TEMPLATE_ONLY_EVENT.replace('<EVENT_NAME>', event_name)
        processed_template = processed_template.replace('<NAME>', event_key)
        processed_template = processed_template + '\n'
    # Add the class' code to list
    classes.append(processed_template)


# Write to file
with open('Utils/Sources/Utils/Analytics/AnalyticEvents.swift', 'w') as file:
    file.write('// GENERATED CODE - DO NOT EDIT\n\n')
    file.write(f'// To change analytic events, change them in {BASE_URL}\n')
    file.write(f'// And run generation scripts again.\n')
    file.write(''.join(classes))
