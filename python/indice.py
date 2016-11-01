from mrjob.job import MRJob
import re
import os
import json
from stop_words import get_stop_words

WORD_RE = re.compile(r"[\w']+")
language = 'es'
before = set(get_stop_words(language, False))

class MRWordFrequencyCount(MRJob):
    def mapper(self, _, line):
        for word in WORD_RE.findall(line):
            if word not in before:
                yield word.lower(), os.environ["mapreduce_map_input_file"]

    def reducer(self, key, values):
        yield key, list(set(values))

if __name__ == '__main__':
    MRWordFrequencyCount.run()
