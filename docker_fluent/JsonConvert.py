import json
from datetime import datetime,date
from time import strftime
with open("/var/log/messages",'r') as data_file:
    for line in data_file:
     #print(line.find('cta-taped'), line)
     #if 'cta-taped.' in line:
        #print(line)
        if 'cta-taped:' in line:
            #print(type(line[4]))
            start_dict = {'TIMESTAMP' : str(date.today().year)+'-0'+str(datetime.strptime(line.split()[0], '%b').month)+'-'+ line.split()[1]+'T'+ line.split()[2]+'.000000+05:00:00', 'NODE' : line.split()[3], 'ACTIVITY': line.split()[4]}
            #start_dict = {'TIMESTAMP' : str(date.today().year)+'-'+str(datetime.strptime(line.split(' ')[0], '%b').month)+'-'+ line.split(' ')[2]+'T'+ line.split(' ')[3], 'NODE' : line.split(' ')[4], 'ACTIVITE': line.split(' ')[5]}
            kv = line.split('cta-taped: ')[1]
            kv = kv.strip('"\n')
            kv_split=kv.split('\" ')
            #print(kv_split)
            for kvp in kv_split:
                try: 
                   kv_split_dict=dict([kvp.split('="')])
                except:
                   print("null")
            start_dict.update(kv_split_dict)
            ##print(start_dict)
            print((json.dumps(start_dict)))
