import dash
from dash import html
from flask import Flask, send_from_directory
import argparse
from dash import dcc, html
from dash.dependencies import Input, Output
from urllib.parse import parse_qs
import dash_bootstrap_components as dbc

from flask import request

server = Flask(__name__)
app = dash.Dash(__name__, server=server)


app.layout = html.Div([
    dcc.Location(id='url', refresh=False),
    html.H1("Hello World App"),
])


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Run the Dash app.')
    parser.add_argument('--host', type=str, default='127.0.0.1', help='Host address')
    parser.add_argument('--port', type=int, default=8050, help='Port number')
    args = parser.parse_args()
    
    app.run_server(host=args.host, port=args.port, debug=True)