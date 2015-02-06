#lang racket

(apply lcm (for/list [[i (sequence-tail (in-port) 1)]] i))
