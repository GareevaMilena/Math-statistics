import numpy as np
import pandas as pd 
import matplotlib.pyplot as plt
import ripper

def whisker_bounds(signal):
    upper_quartile = np.percentile(signal, 75)
    lower_quartile = np.percentile(signal, 25)

    iqr = upper_quartile - lower_quartile
    upper_bound = upper_quartile+1.5*iqr
    lower_bound = lower_quartile-1.5*iqr
    return lower_bound, upper_bound

def moving_average(signal, width):
    """
    For trend extraction of signal
    """
    new_signal = np.zeros_like(signal)
    for i in range(0, signal.shape[0]):
        new_signal[i] = np.mean(signal[max(0, i-width) : min(signal.shape[0], i+width)])
    return new_signal

def is_outlier(signal, width):
    diff = signal - moving_average(signal, width)
    lower_bound, upper_bound = whisker_bounds(diff)
    
    return (diff <= lower_bound) | (diff >= upper_bound)

def replace_outliers(signal, width):
    sgn = signal.copy()
    is_out = is_outlier(sgn, width)
    for idx in np.where(is_out)[0]:
        l = max(0, idx - width)
        r = min(sgn.shape[0], idx + width)
        ss = np.where(~is_out[l:r], sgn[l:r], np.nan)
        sgn[idx] = np.nanmedian(ss)
    return sgn

def confident_outliers_replace(signal):
    # choose width with 10% of data
    replaced = replace_outliers(signal, len(signal) // 10)
    # choose width with 2% of data
    replaced = replace_outliers(replaced, len(signal) // 50)
    return replaced

threshold = .85

def get_useful_signal_boundaries(signal, bin_edges, step=100):
    for i in range(0, len(signal), step):
        part = signal[i:i + step]
        idxs = (bin_edges[0] <= part) & (part <= bin_edges[1])
        if idxs.sum() / step < threshold:
            left = i
            break

    for i in range(len(signal), step, -step):
        part = signal[i - step:i]
        idxs = (bin_edges[0] <= part) & (part <= bin_edges[1])
        if idxs.sum() / step < threshold:
            right = i
            break

    return left, right

def process(timestamp, signal, step=100):
    signal = signal.copy()
    hist, edges = np.histogram(signal)
    idx2, idx1 = np.argsort(hist)[-2:]

    left, right = get_useful_signal_boundaries(signal, (edges[idx1], edges[idx1 + 1]),
                                      step=step)

    if abs(hist[idx1] - hist[idx2]) / signal.shape[0] < 0.2:
        l1, r1 = get_useful_signal_boundaries(signal, (edges[idx2], edges[idx2 + 1]),
                                     step=step)
        left = max(left, l1)
        right = min(right, r1)

    timestamp, signal = timestamp[left:right], signal[left:right]
    signal = confident_outliers_replace(signal)
    return timestamp, signal



# --------------------------------------
signal_n = 20
data_all = ripper.extract('', 38515)[0]

signal_name = data_all[signal_n]['name']
x, amplitude = ripper.x_y(data_all[signal_n])
x, amplitude = np.array(x), np.array(amplitude)

plt.subplot(2, 2, 1)
plt.title(f'Signal {signal_n} - {signal_name}:')
plt.plot(x, amplitude)

plt.subplot(2, 2, 2)
plt.hist(amplitude)

xx, sgn = process(x, amplitude)
plt.subplot(2, 2, 3)
plt.title(f'Processed signal {signal_n} - {signal_name}')
plt.plot(xx, sgn)

plt.subplot(2, 2, 4)
plt.hist(sgn)

plt.tight_layout()
plt.show()
# --------------------------------------





# --------------------------------------
signal_n = 26
data_all = ripper.extract('', 38852)[0]

signal_name = data_all[signal_n]['name']
x, amplitude = ripper.x_y(data_all[signal_n])
x, amplitude = np.array(x), np.array(amplitude)

plt.subplot(2, 2, 1)
plt.title(f'Signal {signal_n} - {signal_name}:')
plt.plot(x, amplitude)

plt.subplot(2, 2, 2)
plt.hist(amplitude)

xx, sgn = process(x, amplitude)
plt.subplot(2, 2, 3)
plt.title(f'Processed signal {signal_n} - {signal_name}')
plt.plot(xx, sgn)

plt.subplot(2, 2, 4)
plt.hist(sgn)

plt.tight_layout()
plt.show()
# --------------------------------------

