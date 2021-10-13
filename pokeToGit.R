# Pokemon-Data set

pokemon = read.csv('pokemon.csv')
View(pokemon)

# checking number of rows and columns
print(nrow(pokemon)) # show number of rows
print(ncol(pokemon)) # show number of columns

print(table(pokemon$is_legendary)) # this will count and show how many
# are legendary and how many are not 
print(table(pokemon$generation))
# this will show number of pokemon under which generation
print(table(pokemon$type1))
# table is like count method in python


print(max(pokemon$hp)) # will show max nmbr of hp of pokemon
print(min(pokemon$hp))

print(min(pokemon$speed)) # show min speed of pokemon
print(max(pokemon$speed))

# checking null values

print(is.na(pokemon$abilities))
# will show that pokemon which has null abilities

print(sum(is.na(pokemon$abilities)))
# this is same as above but will print numerically
# how much number of pokemon have null abilities



# Renaming Columns
colnames(pokemon) # will show the name of all the columns

colnames(pokemon) == 'type1'
# this will show weather the column with name tpye1 
# is weather present or not in pokemon

print(sum(colnames(pokemon) == 'type1'))


colnames(pokemon)[colnames(pokemon) == 'type1'] = 'primaryType'
# this will change the column name of type1 to primaryType
print(colnames(pokemon))

colnames(pokemon)[colnames(pokemon)=='type2'] = 'secondaryType'
# will change column type2 to secondaryType

colnames(pokemon)[colnames(pokemon)=='name'] = 'pokemonName'
# will change name column to pokemonName



# Grass-Pokemon

library(dplyr)
grass = pokemon %>% filter(pokemon$primaryType=='grass')
View(grass)
# this will show all the pokemons that have primary
# type of grass

print(min(grass$speed)) # will count min speed of pokemon
# inside the grass pokemon

print(max(grass$speed))

print(mean(grass$sp_attack))
# show avg sp_attact of grass pokemon
print(mean(grass$sp_defense))



# Visualizing stats of grass pokemon

# HP column
library(ggplot2)
ggplot(data = grass, aes(x=hp)) + geom_histogram()

ggplot(data = grass, aes(x=hp)) + geom_histogram(fill='palegreen4')


# HEIGHT  column

ggplot(data = grass, aes(x=height_m)) + geom_histogram()

# WEIGHT column 

ggplot(data = grass, aes(x=weight_kg)) + geom_histogram(fill='orange')


# Legendary VS not_legendary :

ggplot(data = grass, aes(x=is_legendary)) + geom_bar()




# FIRE TYPE POKEMON :

fire = pokemon %>% filter(pokemon$primaryType=='fire')
View(fire)

print(min(fire$speed))
print(max(fire$speed))


print(mean(fire$sp_attack))
print(mean(fire$sp_defense))

ggplot(data = fire, aes(x=generation, fill=as.factor(generation))) + geom_bar()

ggplot(data = fire, aes(secondaryType, fill=secondaryType)) + geom_bar()


# attack and defense
ggplot(data = fire, aes(x=sp_attack, y=sp_defense)) + geom_point(col='coral')

# height and weight

ggplot(data = fire, aes(x=weight_kg, y=height_m)) + geom_point()


# WATER POKEMON : 

water = pokemon %>% filter(pokemon$primaryType=='water')
View(water)

print(min(water$speed))
print(max(water$speed))


print(mean(water$sp_attack))
print(mean(water$sp_defense))



#  VISUALIZING : 


# against ice pokemon
ggplot(data = water, aes(x=against_ice)) + geom_histogram()


# pokemon against poison

ggplot(data = water, aes(x=against_poison)) + geom_histogram()

