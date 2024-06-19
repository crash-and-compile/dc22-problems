#!/usr/bin/python2.7

import fileinput

def get_locations(grid):
    for n, line in enumerate(grid):
        if 'B' in line:
            beast_pos = line.find('B'), n
        if 'S' in line:
            you_pos = line.find('S'), n
        if 'T' in line:
            treasure_pos = line.find('T'), n
    return you_pos, beast_pos, treasure_pos

def single_move(move, location):
    if move == 'N':
        return location[0], (location[1] - 1) % 10
    if move == 'S':
        return location[0], (location[1] + 1) % 10
    if move == 'W':
        return (location[0] - 1) % 10, location[1]
    if move == 'E':
        return (location[0] + 1) % 10, location[1]

def run_move(move, locations):
    your_move, beast_move = move.split()
    return single_move(your_move, locations[0]), single_move(beast_move, locations[1]), locations[2]

def end_of_game(locations):
    if locations[0] == locations[1]: 
        print "DEATH"
        return True
    if locations[0] == locations[2]:
        print "TREASURE"
        return True
    return False

def run_game(game):
    grid = game[:10]
    locations = get_locations(grid)
    moves = game[10:]
    for move in moves:
        locations = run_move(move, locations)
        if end_of_game(locations):
            return
    print "NOTHING"

def parse_games(all_input):
    games = []
    end = all_input.index('END')
    while end >= 0:
        games.append(all_input[0:end])
        #print "end = {} = {}".format(end, all_input[:end])
        all_input = all_input[end+1:]
        try:
            end = all_input.index('END')
        except:
            break
    return games

if __name__ == '__main__':
    all_input = []
    for line in fileinput.input():
        all_input.append(line.strip())
    games = parse_games(all_input)
    #print "found {} games".format(len(games))
    for game in games:
        run_game(game)
