#!/usr/bin/python

import sys

heat = {
    'best': None,
    'large': {
        'mass': 24,
        'name': 'Large Heat Shunt',
        'value': -3240,
    },
    'small': {
        'mass': 7,
        'name': 'Small Heat Shunt',
        'value': -810,
    },
    'start': float(sys.argv[2]),
}

power = {
    'best': None,
    'large': {
        'heat': 1920,
        'mass': 127,
        'name': 'White Sun Reactor',
        'value': 1488,
    },
    'small': {
        'heat': 1260,
        'mass': 82,
        'name': 'Yellow Sun Reactor',
        'value': 912,
    },
    'start': float(sys.argv[1]),
}

for small in range(1, 21):
    for large in range(1, 21):
        value = (power['small']['value'] * small) + (power['large']['value'] * large) + power['start']
        if value < 0:
            continue
        mass = (power['small']['mass'] * small) + (power['large']['mass'] * large)
        if power['best'] is None or mass < power['best']['mass'] or (mass == power['best']['mass'] and value < power['best']['value']):
            power['best'] = { 'large': large, 'mass': mass, 'small': small, 'value': value }

heat['start'] += (power['small']['heat'] * power['best']['small']) + (power['large']['heat'] * power['best']['large'])

for small in range(1, 21):
    for large in range(1, 21):
        value = (heat['small']['value'] * small) + (heat['large']['value'] * large) + heat['start']
        if value >= 0:
            continue
        mass = (heat['small']['mass'] * small) + (heat['large']['mass'] * large)
        if heat['best'] is None or mass < heat['best']['mass'] or (mass == heat['best']['mass'] and value < heat['best']['value']):
            heat['best'] = { 'large': large, 'mass': mass, 'small': small, 'value': value }

print('\t\t"' + power['small']['name'] + '"', power['best']['small'])
print('\t\t"' + power['large']['name'] + '"', power['best']['large'])
print('\t\t"' + heat['small']['name'] + '"', heat['best']['small'])
print('\t\t"' + heat['large']['name'] + '"', heat['best']['large'])
