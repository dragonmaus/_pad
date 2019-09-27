#!/usr/bin/python3

import sys

heat = {
    'best': None,
    'start': float(sys.argv[2]),
    'tier1': {
        'mass': 7,
        'name': 'Small Heat Shunt',
        'value': -810,
    },
    'tier2': {
        'mass': 24,
        'name': 'Large Heat Shunt',
        'value': -3240,
    },
}

power = {
    'best': None,
    'start': float(sys.argv[1]),
    'tier1': {
        'heat': 780,
        'mass': 47,
        'name': 'Red Sun Reactor',
        'value': 498,
    },
    'tier2': {
        'heat': 1260,
        'mass': 82,
        'name': 'Yellow Sun Reactor',
        'value': 912,
    },
    'tier3': {
        'heat': 1920,
        'mass': 127,
        'name': 'White Sun Reactor',
        'value': 1488,
    },
    'tier4': {
        'heat': 2340,
        'mass': 152,
        'name': 'Blue Sun Reactor',
        'value': 1878,
    },
}

for tier1 in range(0, 51):
    for tier2 in range(0, 51):
        for tier3 in range(0, 51):
            for tier4 in range(0, 51):
                value = (power['tier1']['value'] * tier1) \
                    + (power['tier2']['value'] * tier2) \
                    + (power['tier3']['value'] * tier3) \
                    + (power['tier4']['value'] * tier4) \
                    + power['start']
                if value < 0:
                    continue
                mass = (power['tier1']['mass'] * tier1) \
                    + (power['tier2']['mass'] * tier2) \
                    + (power['tier3']['mass'] * tier3) \
                    + (power['tier4']['mass'] * tier4)
                if power['best'] is None \
                        or mass < power['best']['mass'] \
                        or (mass == power['best']['mass'] and value < power['best']['value']):
                    power['best'] = {
                        'mass': mass,
                        'tier1': tier1,
                        'tier2': tier2,
                        'tier3': tier3,
                        'tier4': tier4,
                        'value': value,
                    }

for tier in ['tier1', 'tier2', 'tier3', 'tier4']:
    heat['start'] += power[tier]['heat'] * power['best'][tier]

for tier1 in range(1, 51):
    for tier2 in range(1, 51):
        value = (heat['tier1']['value'] * tier1) + (heat['tier2']['value'] * tier2) + heat['start']
        if value >= 0:
            continue
        mass = (heat['tier1']['mass'] * tier1) + (heat['tier2']['mass'] * tier2)
        if heat['best'] is None or mass < heat['best']['mass'] or (mass == heat['best']['mass'] and value < heat['best']['value']):
            heat['best'] = { 'tier2': tier2, 'mass': mass, 'tier1': tier1, 'value': value }

for tier in ['tier1', 'tier2', 'tier3', 'tier4']:
    if power['best'][tier] > 0:
        print('\t\t"' + power[tier]['name'] + '"', power['best'][tier])

for tier in ['tier1', 'tier2']:
    if heat['best'][tier] > 0:
        print('\t\t"' + heat[tier]['name'] + '"', heat['best'][tier])
