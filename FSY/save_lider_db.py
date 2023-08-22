import csv

with open('Consultores.csv', 'r') as csvfile:
    reader = csv.reader(csvfile)

    for row in reader:
        if row[0] != 'NOME':
            nome = row[0]
            username = (nome.split(" ")[0] + '.' + nome.split(" ")[1]).lower()
            sexo = row[1]
            telefone = row[2]
            companhia = row[3]

            query = "INSERT INTO lider (name, responsability_level, gender, telephone, company_id, username, password) VALUES ("
            query = query + f"'{nome}', 'CONSULTOR', '{sexo}', '{telefone}', {companhia}, "
            query = query + f"'{username}', '{username}'"
            query = query + ");"

            print(query)