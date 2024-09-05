def show_result(previous, start, goal):
    curCity = goal
    print('Result: ', curCity, end= ' ')
    while curCity != start:
        curCity = previous[curCity]
        print('-> ', curCity, end= ' ')

def showStep(counter, q, previous, attr='total_cost'):
    print('%d. {' % counter, end=' ')
    i = 0
    lenQ = len(q)
    for v in q:
        i += 1
        if (i < lenQ):
            print((v, previous[v][attr], previous[v]['from']), end=', ')
        else:
            print((v, previous[v][attr], previous[v]['from']), end=' ')
    print('}')

def showResultWithAttr(previous, start, goal, attr='total_cost'):
    curCity = goal
    print('Result: ', (curCity, previous[curCity][attr]), end=' ')
    while curCity != start:
        curCity = previous[curCity]['from']
        print('-> ', (curCity, previous[curCity][attr]), end=' ')