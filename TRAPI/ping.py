#++++++++++++ IMPORTATION DES BIBLIOTHEQUES ++++++++++++

from turtle import bgcolor
import socket_utils
from random import random
from statistics import stdev
from argparse import ArgumentParser
from time import sleep
from struct import pack
from socket import SOCK_RAW, gethostbyname, getprotobyname, socket, AF_INET, inet_ntoa, error, gaierror
from sys import exit


class PingStats:
    """
    Class to store information during an instance of program execution
    """
    ip_address = "0.0.0.0"
    url = ""
    packets_sent = 0
    packets_received = 0
    minimum = 9999999999
    maximum = 0
    total = 0
    average = 0
    packet_loss = 1.0
    delays = []
    resping= []


ping_stats = PingStats


def try_ping(stats, destination, timeout, seq_num, packet_size):
    """
    Attempt to send a ping to destination

    @param stats: Runtime statistics for instance of Ping program
    @param destination: destination address for ping
    @param timeout: timeout value
    @param seq_num: sequence number for the ping
    @param packet_size: data size for the ping request
    @return: delay value or None if ping was unsuccessful and the sequence of ping
    """

    delay = None

    try:
        skt = socket(AF_INET, SOCK_RAW, getprotobyname("icmp"))
    except gaierror as e:
        print("error caught")
        if e.errno == 1:
            msg = "ICMP messages can only be sent from processes running as root"
            print("error being raised")
            raise error(msg)
        raise

    my_id = int((id(timeout) * random()) % 65535)

    sent_time = socket_utils.send_ping(skt, destination, my_id, seq_num, packet_size)

    if sent_time is None:
        skt.close()
        return delay

    stats.packets_sent += 1

    receive_time, data_size, iph_source, icmp_seq_num, iph_ttl, address = \
        socket_utils.receive_ping(skt, my_id, timeout, sent_time)

    if address:
        stats.ip_address = address[0]

    skt.close()

    if receive_time:
        delay = (receive_time - sent_time) * 1000
        
        sequence=("%i bytes  from  %s: icmp_seq=%i   ttl=%i   time=%.2f ms" %
              (data_size, inet_ntoa(pack("!I", iph_source)), icmp_seq_num, iph_ttl, delay))
        print(sequence)
        stats.packets_received += 1
        stats.total += delay
        if stats.minimum > delay:
            stats.minimum = delay
        if stats.maximum < delay:
            stats.maximum = delay
    else:
        delay = None
        print("Request timed out.")
        exit()

    return (delay,sequence)


def run_ping(destination, timeout, packet_size=56, count=5, wait=0.5, url=None):
    """
    Begin running the ping program

    @param destination: destination address for the ping request
    @param timeout: timeout value
    @param packet_size: data size for the ping request
    @param count: number of ping requests to send
    @param wait: waiting time between pings
    @param url: url of the destination
    @return: ping statistics or False if the run was unsuccessful
    """

    stats = PingStats()

    if url is not None:
        stats.url = url
    else:
        stats.url = destination

    seq_num = 0

    try:
        address = gethostbyname(destination)
    except gaierror:
        return False

    titre=("PING to {0:}  ({1:}):  {2:}  ({3:}) data bytes".format(address, destination, packet_size, packet_size + 8))
    print(titre)
    try:
        while count != 0:
            
    
            delay,resultat = try_ping(stats, address, timeout, seq_num, packet_size)
            

            if delay is None:  # Request timed out
                return("No packet was received, i.e. the request timed out")
                exit()

            count -= 1

            seq_num += 1
            stats.resping.append('\n' + resultat)

            stats.delays.append(delay)
            

            sleep(wait)
        
        if stats.packets_sent > 0:
            stats.packet_loss = float(100 - (100 * (stats.packets_received / stats.packets_sent)))

        if stats.packets_received > 0:
            stats.average = stats.total / stats.packets_received
            
        if count==0:
            print()
            statis=display_exit_information(stats)
            
        return (titre,stats.resping,statis)

    except error as e:
        
        if e.errno == 1:
            
            print("Error: ICMP messages can only be sent from processes running as root. i.e. run the program as sudo")
            exit()
        raise

    except KeyboardInterrupt:
        print()
        exit()
    



def display_exit_information(stats):
    """
    Display the final statistics from the Ping command

    @param stats: statistics collected from the ping command
    @return: N/A
    """

    if stats.packets_sent > 0:
        stats.packet_loss = float(100 - (100 * (stats.packets_received / stats.packets_sent)))
    if len(stats.delays) < 2:
        stddev = 0
    else:
        stddev = stdev(stats.delays)

    entete=("--- {} ping statistics ---".format(stats.url))
    packet=("{0:} packets transmitted, {1:} packets received, {2:.1f}% packet loss".format(stats.packets_sent, stats.packets_received, stats.packet_loss))
    temps=("round-trip min/avg/max/stddev = {0:2.3f}/ {1:2.3f}/ {2:2.3f}/ {3:2.3f} ms".format(stats.minimum, stats.average, stats.maximum, stddev))
    print('\n',entete,'\n',packet,'\n',temps)
    return ('\n',entete,'\n',packet,'\n',temps)


    
