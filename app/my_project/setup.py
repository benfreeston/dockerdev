from setuptools import setup, find_packages
import os

package_name = os.getenv('PACKAGE_NAME', 'default_package_name')

setup(
    name=package_name,  # This is the name of your package
    version='0.1.0',  # The initial release version
    packages=find_packages(),  # Automatically find all the packages in your project
    install_requires=[
    ],
    python_requires='>=3.6',  # Minimum version requirement of Python
)