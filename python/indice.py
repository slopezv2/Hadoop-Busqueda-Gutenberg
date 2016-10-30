from mrjob.job import MRJob
import re
import os
import json
from stop_words import get_stop_words
WORD_RE = re.compile(r"[\w']+")
language = 'es'
before = get_stop_words(language, False)
class MRWordFrequencyCount(MRJob):
    def mapper(self, _, line):
        for word in WORD_RE.findall(line):
            yield word, os.environ["mapreduce_map_input_file"]

    def reducer(self, key, values):
        if key not in before:
            yield key, list(set(values))
if __name__ == '__main__':
    MRWordFrequencyCount.run()
