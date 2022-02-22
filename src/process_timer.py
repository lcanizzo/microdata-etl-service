import time

def time_execution(cb):
    start = time.time()

    cb()

    end = time.time()
    elapsed_sec = int(end - start)
    elapsed_min = elapsed_sec / 60
    print(f'{elapsed_min} minutes elapsed')
    print('done')