%Method 1
mu = 10
sigma = 2
N = [5, 10, 20, 40, 80, 160, 1000]
for N = [5, 10, 20, 40, 80, 160, 1000]
confidence = .95
samples = normrnd(mu, sigma, N, 1);
sem = (sigma/sqrt(N))
z = norminv (0.5*(1-.95))
confint = (mean(samples) - sem*z)
confint2 = (mean(samples) + sem*z)
end

%Method 2
mean = 10
std = 2
confidence = .95
N = [5, 10, 20, 40, 80, 160, 1000]
for n = N
    df = n-1
    SEM = std/sqrt(N)
    t_stat = tinv(confidence, df)
    CI = [(mean-SEM *t_stat),(mean+SEM *t_stat)]
end 

%Method3
mean = 10 
std = 2
N = [5, 10, 20, 40, 80, 160, 1000]
for n = N
    rand_sample = normrnd(mean, std, n)
    CI = bootci(n,@mean, rand_sample)
end 
    
