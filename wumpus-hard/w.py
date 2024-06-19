#!/usr/bin/python2.7
#
# problem solution by understudy from quantum koala coalition
# dance@bochs.info

import sys

class Point:
    def __init__(self, x, y):
        self.x = x
        self.y = y

    def move(self, d):
        if d == 'E':
            self.x += 1
        elif d == 'W':
            self.x -= 1
        elif d == 'N':
            self.y -= 1
        elif d == 'S':
            self.y += 1

        self.x = self.x % 10
        self.y = self.y % 10

    def __eq__(self, other):
        return self.x == other.x and self.y == other.y

    def __repr__(self):
        return '(%d, %d)' % (self.x, self.y)

class Grid:
    def __init__(self, grid):
        self.grid = grid
        self.player = self.scan('S')
        self.treasure = self.scan('T')
        self.wumpus = self.scan('B')
        self.status = None

    def scan(self, char):
        grid = self.grid
        for x in xrange(10):
            for y in xrange(10):
                if grid[y][x] == char:
                    return Point(x, y)

    def check(self):
        if self.player == self.wumpus:
            return 'DEATH'
        elif self.player == self.treasure:
            return 'TREASURE'

    def move(self, p, w):
        if self.status:
            return

        self.player.move(p)
        self.status = self.check()
        if self.status:
            return self.status

        self.wumpus.move(w)
        self.status = self.check()
        if self.status:
            return self.status

    def end(self):
        if not self.status:
            return 'NOTHING'

line = True
status = None
game = None
while line:
    if not game:
        grid = [[] for i in xrange(10)]
        for i in xrange(10):
            line = sys.stdin.readline().strip()
            if not line:
                sys.exit(0)
            grid[i].extend(line)
        game = Grid(grid)

    line = sys.stdin.readline().strip()
    if line == 'END':
        status = game.end()
        if status:
            print status
        game = None
    else:
        p, w = line.split(' ', 1)
        status = game.move(p, w)
        if status:
            print status
